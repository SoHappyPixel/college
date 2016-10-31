from .models import Product
from .forms import ProductForm
from .forms import CustomerForm
from django.shortcuts import render, HttpResponseRedirect

def check_form( form, redirect_path ):
    if form.is_valid():
        instance = form.save(commit = False)
        print instance
        instance.save()
        return HttpResponseRedirect( redirect_path )


# home is the Index view.
def home(request):
    welcome = 'A new reality for your feet !'
    context = { 'welcome': welcome }
    return render(request,'Home.html',context)


# CUSTOMER VIEWS.

# ... profileCustomer let your clients view themselves profile.

# ... newCustomer let you add clients (or that them register) to your site.
def newCustomer(request):
    form = CustomerForm( request.POST or None )
    check_form( form, '/newCustomer' )

    title = 'Join now !!!'

    context = {
        'title':title,
        'form':form,
    }

    return render(request,'newCustomer.html',context)


# PRODUCT VIEWS.

# ... newProduct let you add products to your site.
def newProduct(request):
    form = ProductForm( request.POST or None )
    check_form( form, '/newProduct' )

    title = 'Add item !'

    context = {
        'form':form,
        'title':title,
    }

    return render( request, 'NewProduct.html', context )

# ... listProducts let you visualize all the prodcucts on your catalog.
def listProducts(request):
    query_set = Product.objects.all()

    title = 'Product List ...'

    context = {
        'query_set' : query_set,
        'title' : title,
    }

    return render( request, 'ListProducts.html', context )
