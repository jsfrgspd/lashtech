from django.urls import path
from django.urls.conf import include, re_path
from django.conf import settings  
from django.conf.urls.static import static  
from . import views

urlpatterns = [
path("", views.index, name="index"),
path("home", views.home, name="home"),
path("signup", views.signup_view, name="signup"),
path("signin", views.signin_view, name="signin"),
path("signout", views.signout_view, name="signout"),
path("admin", views.admin, name="admin"),
path("nearby_salons", views.nearby_salons, name="nearby_salons"),
path("appointment_booking", views.appointment_booking, name="appointment_booking"),
path("appointment_booking_accept/<int:id>", views.appointment_booking_accept, name="appointment_booking_accept"),
path("booking_view/<int:id>", views.appointment_booking_view, name="booking_view"),
path("bookingsendemail/<int:id>", views.booking_send_email, name="bookingsendemail"),
path("allsendemail/", views.all_send_email, name="allsendemail"),
]


if settings.DEBUG:  
        urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)  