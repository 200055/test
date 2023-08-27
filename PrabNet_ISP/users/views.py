from django.shortcuts import render, redirect
from django.contrib import messages
from accounts.auth import *
from django.contrib.auth.decorators import login_required
from .models import Profile
from .forms import ProfileForm
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib.auth import update_session_auth_hash


@login_required
@user_only
def dashboard(request):
    context = {
        'activate_dashboard': 'active',
    }
    return render(request, 'users/dashboard.html', context)


@login_required
@user_only
def profile(request):
    try:
        profile = request.user.profile
    except:
        profile = Profile(user=request.user)
    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=profile)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Profile updated successfully")
            return redirect('/profile')
    context = {
        'form_user': ProfileForm(instance=profile),
        'activate_profile': 'active',

    }
    return render(request, 'users/profile.html', context)


@login_required
@user_only
def change_user_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.add_message(request, messages.SUCCESS, "Password changed successfully")
            return redirect('/users/profile')
        else:
            messages.add_message(request, messages.ERROR, "Please verify the form fields")
            return render(request, '/users/change_user_password.html', {'user_password_change_form': form})
    context = {
        'user_password_change_form': PasswordChangeForm(request.user),

    }
    return render(request, 'users/change_user_password.html', context)


@login_required
@user_only
def update_details(request):
    profile = request.user.profile
    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=profile)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Profile updated successfully")
            return redirect('/users/profile')
    context = {
        'form_user': ProfileForm(instance=profile),

    }
    return render(request, 'users/update_details.html', context)
