from django import forms
from django.forms import ModelForm
from .models import Category, OrderPlan


class CategoryForm(ModelForm):
    class Meta:
        model = Category
        fields = "__all__"


class OrderPlanForm(ModelForm):
    class Meta:
        model = OrderPlan
        fields = "__all__"