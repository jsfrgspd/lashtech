from django.db import models
from django.contrib.auth.models import UserManager, AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.utils import timezone

# Create your models here.

class CustomAccountManager(BaseUserManager):

    def create_superuser(self, email, user_name, password, **other_fields):

        other_fields.setdefault('is_staff', True)
        other_fields.setdefault('is_superuser', True)
        other_fields.setdefault('is_active', True)

        if other_fields.get('is_staff') is not True:
            raise ValueError('Superuser must be assigned to is_staff=True.')
        if other_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must be assigned to is_superuser=True.')
        
        return self.create_user(email, user_name, password, **other_fields)
    def create_user(self, email, user_name, password, **other_fields):

        if not email:
            raise ValueError('You must provide an email adress')

        email = self.normalize_email(email)
        user = self.model(email=email, user_name=user_name, **other_fields)
        user.set_password(password)
        user.save()
        return user


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    user_name = models.CharField(max_length=150, unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    last_login = models.DateTimeField(blank=True, null=True)

    objects = CustomAccountManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['user_name']

    def __str__(self):
        return self.email


class Salon(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    latitude = models.DecimalField(max_digits=10, decimal_places=6)
    longitude = models.DecimalField(max_digits=10, decimal_places=6)


class Appointment(models.Model):
    userid = models.ForeignKey(User, blank=True, null=True, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=150, blank=True, null=True)
    contact_no = models.BigIntegerField(blank=True, null=True)
    email = models.ForeignKey(User, null=True, to_field='email', on_delete=models.CASCADE, related_name="user_email")
    start_date = models.DateField(blank=True, null=True)
    user_time = models.TimeField(blank=True, null=True)
    file = models.ImageField(upload_to='images/', blank=True, null=True)
    is_verified = models.BooleanField(default=False)

    def __str__(self):
        return self.email.email