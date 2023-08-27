from django.shortcuts import render, redirect
from internet.models import OrderPlan
from django.shortcuts import render
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .forms import InternetOutageForm
from .models import InternetOutage
from accounts.auth import unauthenticated_user, admin_only, user_only
from django.contrib.auth.decorators import login_required
from django.contrib.auth import update_session_auth_hash
from accounts.models import Contact_Us
from internet.models import OrderPlan
from accounts.models import Contact_Us
from store.models import Product
from internet.models import Category
from accounts .forms import CreateUserForm


@login_required
@admin_only
def dashboard(request):
    user = User.objects.filter(is_staff=0)
    user_count = user.count()
    staffs = User.objects.filter(is_staff=1)
    staffs_count = staffs.count()
    categories = Category.objects.all()
    categories_count = categories.count()
    products = Product.objects.all()
    products_count = products.count()
    plan_request = OrderPlan.objects.all()
    plan_request_count = plan_request.count()
    feedbacks = Contact_Us.objects.all()
    feedbacks_count = feedbacks.count()

    context = {
        'user': user_count,
        'staffs': staffs_count,
        'categories': categories_count,
        'products': products_count,
        'plan_request': plan_request_count,
        'feedbacks': feedbacks_count,

    }
    return render(request, 'admins/dashboard.html', context)


def plan_request(request):
    plan_request = OrderPlan.objects.all().order_by('-id')
    context = {
        'plan_request': plan_request
    }
    return render(request, 'admins/plan_request.html', context)


@login_required
@admin_only
def delete_plan_request(request, request_id):
    plan_request = OrderPlan.objects.get(id=request_id)
    plan_request.delete()
    messages.add_message(request, messages.SUCCESS, 'Plan request deleted successfully')
    return redirect('/admins/plan_request')


@login_required
@admin_only
def internet_outage_form(request):
    if request.method == 'POST':
        form = InternetOutageForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Notice added successfully')
            return redirect("/admins/get_internet_outage")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add notice')
            return render(request, 'admins/internet_outage_form.html', {'form_notice': form})
    context = {
        'form_notice': InternetOutageForm,

    }
    return render(request, 'admins/internet_outage_form.html', context)


@login_required
@admin_only
def get_internet_outage(request):
    notice = InternetOutage.objects.all().order_by('-id')
    context = {
        'notice': notice,

    }
    return render(request, 'admins/get_internet_outage.html', context)


@login_required
@admin_only
def delete_internet_outage(request, notice_id):
    notice = InternetOutage.objects.get(id=notice_id)
    notice.delete()
    messages.add_message(request, messages.SUCCESS, 'Notice deleted successfully')
    return redirect('/admins/get_internet_outage')

@login_required
@admin_only
def delete_user(request, user_id):
    user = User.objects.get(id=user_id)
    user.delete()
    messages.add_message(request, messages.SUCCESS, 'User deleted successfully')
    return redirect('/admins/users')

@login_required
@admin_only
def delete_staff(request, staff_id):
    staff = User.objects.get(id=staff_id)
    staff.delete()
    messages.add_message(request, messages.SUCCESS, 'Staff deleted successfully')
    return redirect('/admins/staffs')

@login_required
@admin_only
def update_internet_outage(request, notice_id):
    notice = InternetOutage.objects.get(id=notice_id)
    if request.method == 'POST':
        form = InternetOutageForm(request.POST, request.FILES, instance=notice)
        if form.is_valid():
            # if request.FILES.get('food_image'):
            #     os.remove(notice.notice_image.path)
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Notice updated successfully')
            return redirect("/admins/get_internet_outage")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to update Notice')
            return render(request, 'admins/update_internet_outage.html', {'form_notice': form})
    context = {
        'form_notice': InternetOutageForm(instance=notice),

    }
    return render(request, 'admins/update_internet_outage.html', context)


@login_required
@user_only
def show_internet_outage(request):
    notice = InternetOutage.objects.all().order_by('-id')
    context = {
        'notice': notice
    }
    return render(request, 'admins/show_internet_outage.html', context)


@login_required
@admin_only
def feedbacks(request):
    contact_feedback = Contact_Us.objects.all().order_by('-id')
    context = {
        'c_message': contact_feedback
    }
    return render(request, 'admins/feedback.html', context)


@login_required
@admin_only
def show_users(request):
    users = User.objects.filter(is_staff=0).order_by('-id')
    context = {
        'users': users
    }
    return render(request, 'admins/users.html', context)


@login_required
@admin_only
def show_staffs(request):
    staffs = User.objects.filter(is_staff=1).order_by('-id')
    context = {
        'staffs': staffs
    }
    return render(request, 'admins/staffs.html', context)


@login_required
@admin_only
def promote_user(request, user_id):
    user = User.objects.get(id=user_id)
    user.is_staff = True
    user.save()
    messages.add_message(request, messages.SUCCESS, 'User Promoted To Staff')
    return redirect('/admins/staffs')


@login_required
@admin_only
def demote_staff(request, user_id):
    staff = User.objects.get(id=user_id)
    staff.is_staff = False
    staff.save()
    messages.add_message(request, messages.SUCCESS, 'Staff Demoted To User')
    return redirect('/admins/users')


@login_required
@admin_only
def register_user(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "User Registered Successfully")
            return redirect('/admins/users')
        else:
            messages.add_message(request, messages.ERROR, "Unable To Register User")
            return render(request, 'admins/adduser.html', {'form_register': form})
    context = {
        'form_register': CreateUserForm,
    }
    return render(request, 'admins/adduser.html', context)
