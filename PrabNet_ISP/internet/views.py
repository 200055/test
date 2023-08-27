from django.shortcuts import render, redirect
from .forms import CategoryForm
from django.contrib import messages
from .models import Category
from accounts.auth import admin_only, user_only
from django.contrib.auth.decorators import login_required
import os


@login_required
@admin_only
def category_form(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Category added successfully')
            return redirect("/internet/get_category")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add category')
            return render(request, 'internet/category_form.html', {'form_category': form})
    context = {
        'form_category': CategoryForm,

    }
    return render(request, 'internet/category_form.html', context)


@login_required
@admin_only
def get_category(request):
    categories = Category.objects.all()
    context = {
        'categories': categories,

    }
    return render(request, 'internet/get_category.html', context)


@login_required
@admin_only
def delete_category(request, category_id):
    category = Category.objects.get(id=category_id)
    category.delete()
    messages.add_message(request, messages.SUCCESS, 'Category deleted successfully')
    return redirect('/internet/get_category')


@login_required
@admin_only
def update_category(request, category_id):
    category = Category.objects.get(id=category_id)
    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Category updated successfully')
            return redirect("/internet/get_category")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to update category')
            return render(request, 'internet/update_category.html', {'form_category': form})
    context = {
        'form_category': CategoryForm(instance=category),

    }
    return render(request, 'internet/update_category.html', context)




