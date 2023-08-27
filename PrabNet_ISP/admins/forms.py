from django import forms
from django.forms import ModelForm
from .models import InternetOutage


class InternetOutageForm(ModelForm):
    class Meta:
        model = InternetOutage
        fields = "__all__"
