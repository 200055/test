from django.db import models
from django.core.validators import *
from django.core import validators
from django.contrib.auth.models import *
from internet .models import Category


class Profile(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    username = models.CharField(max_length=100)
    email = models.EmailField()
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    phone = models.CharField(max_length=20)
    address = models.CharField(max_length=100)
    profile_pic = models.FileField(upload_to='static/profile', default='static/images/default_user.png')
    plan_name = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    created_date = models.DateTimeField(auto_now_add=True)

