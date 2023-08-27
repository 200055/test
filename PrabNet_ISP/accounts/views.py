from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .forms import LoginForm, CreateUserForm, ContactForm
from accounts.auth import unauthenticated_user, admin_only, user_only
from django.contrib.auth.decorators import login_required
from internet.models import OrderPlan
from users .models import Profile
from internet.forms import OrderPlanForm
from .models import Contact_Us


def homepage(request):
    return render(request, 'accounts/homepage.html')


@login_required
def logout_user(request):
    logout(request)
    return redirect('/login')


@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            user = authenticate(request, username=data['username'], password=data['password'])
            if user is not None:
                if user.is_staff:
                    login(request, user)
                    return redirect('/admins/admin_dashboard')
                elif not user.is_staff:
                    login(request, user)
                    return redirect('/users/profile')
            else:
                messages.add_message(request, messages.ERROR, "Invalid Username/Password")
                return render(request, 'accounts/login.html', {'form_login': form})
    context = {
        'form_login': LoginForm,
        'activate_login': 'active'
    }
    return render(request, 'accounts/login.html', context)


@unauthenticated_user
def register_user(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            Profile.objects.create(user=user, username=user.username)
            messages.add_message(request, messages.SUCCESS, 'User registered successfully')
            return redirect('/login')
        else:
            messages.add_message(request, messages.ERROR, 'Unable to register user')
            return render(request, 'accounts/register.html', {'form_register': form})

    context = {
        'form_register': CreateUserForm,

    }
    return render(request, 'accounts/register.html', context)




def order_plan(request):
    if request.method == 'POST':
        form = OrderPlanForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Plan ordered successfully')
            return redirect("/services")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to order Plan')
            return render(request, 'accounts/services.html', {'form_plan': form})
    context = {
        'form_plan': OrderPlanForm,

    }
    return render(request, 'accounts/services.html', context)


def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Message sent successfully')
            return redirect("/contact")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to send message')
            return render(request, 'accounts/contact.html', {'form_contact': form})
    context = {
        'form_contact': ContactForm,

    }
    return render(request, 'accounts/contact.html', context)



def about_us(request):
    return render(request, 'accounts/about.html')