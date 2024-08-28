from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import login, logout, authenticate, get_user_model
from django.contrib.auth.decorators import login_required
from googlemaps import Client
from .models import Salon, Appointment
from django.utils import timezone
from datetime import datetime, timedelta
from django.core.mail import send_mail
# Create your views here.

@login_required(login_url='signin')
def home(request):
    User = get_user_model()
    if request.method == "POST":
        current_user = request.user
        users = User.objects.get(email=current_user.email)
        email = users
        user_id = User.objects.get(id=current_user.id)
        userid = user_id
        full_name = request.POST['full_name']
        contact_no = request.POST['contact_no']
        start_date = request.POST['start_date']
        user_time = request.POST['user_time']
        file = request.FILES.get('file')

        appointmentform = Appointment(email=email, full_name=full_name, contact_no=contact_no, start_date=start_date, user_time=user_time, userid=userid, file=file)
        appointmentform.save()

        return redirect('home')

    return render(request, "obj/home.html", {})


@login_required(login_url='signin')
def admin(request):
    User = get_user_model()
    users = User.objects.all()
    numberof_user = len(User.objects.all())
    # appointments = Appointment.objects.select_related('email').all()

    context = {
        'users': users,
        'numberof_user': numberof_user,
        # 'appointments': appointments,
    }
    return render(request, "obj/admin.html", context)


def index(request):
    return render(request, "obj/index.html", {})


def signup_view(request):
    context = {}
    if request.method == "POST":
        email = request.POST['email']
        user_name = request.POST['user_name']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        context["email"] = email
        context["user_name"] = user_name

        User = get_user_model()
        if User.objects.filter(email=email):
            messages.error(request, "Email already exist! Please try a different email.")
            return render (request, 'obj/signup.html', context)

        if User.objects.filter(user_name=user_name):
            messages.error(request, "Username already exist! Please try a different username.")
            return render (request, 'obj/signup.html', context)

        if not user_name.isalnum():
            messages.error(request, "Username must be Alpha-Numerical!")
            return render (request, 'obj/signup.html', context)
        
        if len(user_name)>16:
            messages.error(request, "Username must be under 16 characters.")
            return render (request, 'obj/signup.html', context)

        if password != confirm_password:
            messages.error(request, "Password do not match!") 
            return render (request, 'obj/signup.html', context)

        if len(password)<8:
            messages.error(request, 
            "Password must contain atleast 8 characters. Password must contain at least 1 number. Password must contain at least 1 uppercase letter. Password must contain at least 1 lowercase letter"
            )
            return render (request, 'obj/signup.html', context)
        
        if sum(c.isdigit() for c in password) < 1:
            messages.error(request, 
            "Password must contain atleast 8 characters. Password must contain at least 1 number. Password must contain at least 1 uppercase letter. Password must contain at least 1 lowercase letter"
            )
            return render (request, 'obj/signup.html', context)
        
        if not any(c.isupper() for c in password):
            messages.error(request, 
            "Password must contain atleast 8 characters. Password must contain at least 1 number. Password must contain at least 1 uppercase letter. Password must contain at least 1 lowercase letter"
            )
            return render (request, 'obj/signup.html', context)
        
        if not any(c.islower() for c in password):
            messages.error(request, 
            "Password must contain atleast 8 characters. Password must contain at least 1 number. Password must contain at least 1 uppercase letter. Password must contain at least 1 lowercase letter"
            )
            return render (request, 'obj/signup.html', context)

        myuser = User.objects.create_user(email, user_name, password)
        myuser.save()

        messages.success(request, "Your account has been successfully created.")

        return redirect('signin')

    return render(request, "obj/signup.html", {})


def signin_view(request):
    context = {}
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        
        context["email"] = email
        
        user = authenticate(email=email, password=password)
        if user is not None:
            login(request, user)
            if user.is_superuser:               
                    return redirect('admin')
            elif user.is_superuser==False:
                    return redirect('home')           
        else:
            messages.error(request, "Incorrect email or password.")
            return render (request, 'obj/signin.html', context)

    return render(request, "obj/signin.html", {})


def signout_view(request):
    
    logout(request)
    return redirect('index')


def nearby_salons(request):
    # Get the user's current location.
    latitude = request.GET.get('latitude')
    longitude = request.GET.get('longitude')

    # Create a Google Maps client.
    client = Client()

    # Find nearby salons.
    nearby_places = client.places_nearby(
        location=(latitude, longitude),
        radius=5000,
        type='hair_salon'
    )

    # Filter the results to only include salons that are open.
    open_salons = []
    for place in nearby_places['results']:
        if place['opening_hours']['open_now']:
            open_salons.append(place)

    context = {
        'salons': open_salons
    }
    # Render the results to the user.
    return render(request, 'obj/nearby_salons.html', context)


def appointment_booking(request):
    # Not Verified
    booking = Appointment.objects.filter(
        is_verified=0,
        )
    
    # Not Verified Length
    nnotverified_booking = len(Appointment.objects.filter(
        is_verified=0,
        ))

    # Verified
    booking_accepted = Appointment.objects.filter(
        is_verified=1,
        )
    
    # Verified Length
    nverified_booking = len(Appointment.objects.filter(
        is_verified=1,
        ))

    # Notification
    previous = timezone.now() + timedelta(days=1)
    booking_notification = Appointment.objects.filter(
        is_verified=1,
        start_date=previous,
        )
    
    # Notification Length
    previous = timezone.now() + timedelta(days=1)
    nbooking_notification = len(Appointment.objects.filter(
        is_verified=1,
        start_date=previous,
        ))

    print("Previous:", previous)
    print("Booking Notification Length:", nbooking_notification)
    
    context = {
        'booking': booking,
        'nnotverified_booking': nnotverified_booking,
        'booking_accepted': booking_accepted,
        'nverified_booking': nverified_booking,
        'booking_notification': booking_notification,
        'nbooking_notification': nbooking_notification,
    
    }
    return render(request, "obj/appointment_booking.html", context)


def appointment_booking_accept(request, id):
    booking = Appointment.objects.get(id=id)
    booking.is_verified = 1

    booking.save()
    return redirect('appointment_booking')


def appointment_booking_view(request, id):
    booking = Appointment.objects.get(id=id)
  
    context = {
        'booking': booking,
    }
    return render(request, "obj/booking_view.html", context)


def booking_send_email(request, id):
    booking = Appointment.objects.get(id=id)
    # Get all subscriptions with end_date within 3 days from now
    # if monthly.end_date == timezone.now()+timezone.timedelta(days=3):
    email_subject = "Your appointment is tomorrow!"
    email_body = "Hi {}, your appointment is tomorrow on {}. Please be ready.".format(booking.full_name, booking.start_date)
    send_mail(
        email_subject,
        email_body,
        'settings.EMAIL_HOST_USER',
        [booking.email],
        fail_silently=False,
    )
    return redirect('appointment_booking')

def all_send_email(request):
    if request.method == 'POST':
        previous = timezone.now() + timedelta(days=1)
        booking = Appointment.objects.filter(
            is_verified=1,
            start_date=previous,
            )
        
        for data in booking:
            email_subject = "Your appointment is tomorrow!"
            email_body = "Hi {}, your appointment is tomorrow on {}. Please be ready.".format(data.full_name, data.start_date)
            send_mail(
                email_subject,
                email_body,
                'settings.EMAIL_HOST_USER',
                [data.email],
                fail_silently=False,
            )
            
        return redirect('appointment_booking')
    return render(request, 'obj/appointment_booking.html')
