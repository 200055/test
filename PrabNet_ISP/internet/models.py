from django.db import models
from django.core.validators import *
from django.core import validators


class Category(models.Model):
    plan_name = models.CharField(max_length=200, null=True, validators=[validators.MinLengthValidator(2)])

    def __str__(self):
        return self.plan_name

class OrderPlan(models.Model):
    full_name = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    plan_name = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    number = models.CharField(max_length=200)

    def __str__(self):
        return self.full_name



