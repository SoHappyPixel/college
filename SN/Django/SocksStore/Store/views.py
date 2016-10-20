from django.shortcuts import render, HttpResponseRedirect

from .forms import ProductForm
from .forms import CustomerForm

from .models import Product


def home(request):
    welcome = 'A new reality for your feet !'
    context = { 'welcome': welcome }
    return render(request,'Home.html',context)


def newCustomer(request):
    form = CustomerForm( request.POST or None )

    if form.is_valid():
        instance = form.save(commit = False)
        print instance
        instance.save()
        return HttpResponseRedirect( '/newCustomer' )

    title = 'Join now !!!'
    context = {
        'title':title,
        'form':form,
    }

    return render(request,'newCustomer.html',context)


def newProduct(request):
    form = ProductForm( request.POST or None )

    if form.is_valid():
        instance = form.save(commit = False)
        print instance
        instance.save()
        return HttpResponseRedirect( '/newProduct' )

    title = 'Add item !'
    context={
        'title':title,
        'form':form,
    }

    return render(request,'NewProduct.html',context)


def listProducts(request):
    querySet = Product.objects.all()

    title = 'Product List ...'

    context = {
        'querySet' : querySet,
        'title' : title,
    }

    return render(request,'ListProducts.html',context)
