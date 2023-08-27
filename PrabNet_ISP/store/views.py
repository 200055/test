from django.shortcuts import render, redirect
from .forms import CategoryForm, ProductForm, OrderForm
from django.contrib import messages
from .models import Category, Product, Cart, Order
from accounts.auth import admin_only, user_only
from django.contrib.auth.decorators import login_required
import os

import requests as req

@login_required
@admin_only
def category_form(request):
    if request.method == "POST":
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Category added successfully')
            return redirect("/store/get_category")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add category')
            return render(request, 'store/category_form.html', {'form_category': form})
    context = {
        'form_category': CategoryForm,
        'activate_category': 'active'
    }
    return render(request, 'store/category_form.html', context)


@login_required
@admin_only
def get_category(request):
    categories = Category.objects.all()
    context = {
        'categories': categories,
        'activate_category': 'active'
    }
    return render(request, 'store/get_category.html', context)


@login_required
@admin_only
def delete_category(request, category_id):
    category = Category.objects.get(id=category_id)
    category.delete()
    messages.add_message(request, messages.SUCCESS, 'Category Deleted Successfully')
    return redirect('/store/get_category')


@login_required
@admin_only
def category_update_form(request, category_id):
    category = Category.objects.get(id=category_id)
    if request.method == "POST":
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Category updated successfully')
            return redirect("/store/get_category")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to update category')
            return render(request, 'store/category_update_form.html', {'form_category': form})
    context = {
        'form_category': CategoryForm(instance=category),
        'activate_category': 'active'
    }
    return render(request, 'store/category_update_form.html', context)


@login_required
@admin_only
def products_form(request):
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Product added successfully')
            return redirect("/store/get_product")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add product')
            return render(request, 'store/product_form.html', {'form_product': form})
    context = {
        'form_product': ProductForm,
        'activate_product': 'active'
    }
    return render(request, 'store/product_form.html', context)


@login_required
@admin_only
def get_product(request):
    products = Product.objects.all().order_by('-id')
    context = {
        'products': products,
        'activate_product': 'active'
    }
    return render(request, 'store/get_product.html', context)


@login_required
@admin_only
def delete_product(request, product_id):
    product = Product.objects.get(id=product_id)
    os.remove(product.product_image.path)
    product.delete()
    messages.add_message(request, messages.SUCCESS, 'Product Deleted Successfully')
    return redirect('/store/get_product')


@login_required
@admin_only
def product_update_form(request, product_id):
    product = Product.objects.get(id=product_id)
    if request.method == "POST":
        if request.FILES.get('product_image'):
            os.remove(product.product_image.path)
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Product updated successfully')
            return redirect("/store/get_product")
        else:
            messages.add_message(request, messages.ERROR, 'Unable to update product')
            return render(request, 'store/product_form.html', {'form_product': form})
    context = {
        'form_product': ProductForm(instance=product),
        'activate_product': 'active'
    }
    return render(request, 'store/product_update_form.html', context)


def menu(request):
    categories = Category.objects.all().order_by('-id')
    context = {
        'categories': categories,
        'activate_menu': 'active'
    }
    return render(request, 'store/menu.html', context)


@login_required
@user_only
def add_to_cart(request, product_id):
    user = request.user
    product = Product.objects.get(id=product_id)

    check_item_presence = Cart.objects.filter(user=user, product=product)
    if check_item_presence:
        messages.add_message(request, messages.ERROR, 'Item is already present in cart')
        return redirect('/store/mycart')
    else:
        cart = Cart.objects.create(product=product, user=user)
        if cart:
            messages.add_message(request, messages.SUCCESS, 'Item added to cart')
            return redirect('/store/mycart')
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add item to cart')


@login_required
@user_only
def show_cart_items(request):
    user = request.user
    items = Cart.objects.filter(user=user)
    context = {
        'items': items,
        'activate_my_cart': 'active'
    }
    return render(request, 'store/mycart.html', context)


@login_required
@user_only
def remove_cart_item(request, cart_id):
    item = Cart.objects.get(id=cart_id)
    item.delete()
    messages.add_message(request, messages.SUCCESS, 'Cart item removed successfully')
    return redirect('/store/mycart')


@login_required
@user_only
def order_form(request, product_id, cart_id):
    user = request.user
    product = Product.objects.get(id=product_id)
    cart_item = Cart.objects.get(id=cart_id)
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            quantity = request.POST.get('quantity')
            price = product.product_price
            total_price = int(quantity) * int(price)
            contact_no = request.POST.get('contact_no')
            contact_address = request.POST.get('contact_address')
            payment_method = request.POST.get('payment_method')
            order = Order.objects.create(product=product,
                                         user=user,
                                         quantity=quantity,
                                         total_price=total_price,
                                         contact_no=contact_no,
                                         contact_address=contact_address,
                                         status="Pending",
                                         payment_method=payment_method,
                                         payment_status=False
                                         )
            if order:
                # messages.add_message(request, messages.SUCCESS, 'Item Ordered. Continue Payment for Verification')
                # cart_item.delete()
                context = {
                    'order': order,
                    'cart': cart_item
                }
                return render(request, 'store/esewa_payment.html', context)
        else:
            messages.add_message(request, messages.ERROR, 'Something went wrong')
            return render(request, 'store/order_form.html', {'order_form': form})
    context = {
        'order_form': OrderForm
    }
    return render(request, 'store/order_form.html', context)



def esewa_verify(request):
    import xml.etree.ElementTree as ET
    o_id = request.GET.get('oid')
    amount = request.GET.get('amt')
    refId = request.GET.get('refId')
    url = "https://uat.esewa.com.np/epay/transrec"
    d = {
        'amt': amount,
        'scd': 'EPAYTEST',
        'rid': refId,
        'pid': o_id,
    }
    resp = req.post(url, d)
    root = ET.fromstring(resp.content)
    status = root[0].text.strip()
    if status == 'Success':
        order_id = o_id.split("_")[0]
        order = Order.objects.get(id=order_id)
        order.payment_status = True
        order.save()
        cart_id = o_id.split("_")[1]
        cart = Cart.objects.get(id=cart_id)
        cart.delete()
        messages.add_message(request, messages.SUCCESS, 'Payment Successful')
        return redirect('/store/mycart')
    else:
        messages.add_message(request, messages.ERROR, 'Unable to make payment')
        return redirect('/store/mycart')


@login_required
@user_only
def my_order(request):
    user = request.user
    items = Order.objects.filter(user=user).order_by('-id')
    context = {
        'items': items,
        'activate_myorders': 'active'
    }
    return render(request, 'store/my_order.html', context)
