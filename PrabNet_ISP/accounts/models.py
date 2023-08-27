from django.db import models
from django.contrib.auth.models import User


class Contact_Us(models.Model):
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    email = models.EmailField()
    number = models.CharField(max_length=10)
    message = models.TextField()

    def __str__(self):
        return self.first_name