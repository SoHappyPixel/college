from django.shortcuts import render, render_to_response, RequestContext, HttpResponseRedirect


def home(request):
    return render_to_response('Home.html',
        locals(),
        context_instance=RequestContext(request))


from .forms import CustomerForm
def newCustomer(request):
    form = CustomerForm( request.POST or None )

    if form.is_valid():
        instance = form.save(commit = False)
        print instance
        instance.save()
        context= {
            "title":"Thank you"
        }

    title = "Join now !!!"

    context={
        "title":title,
        "form":form,
    }

    return render(request,'newCustomer.html',context)


from .forms import ProductForm
def newProduct(request):
    form = ProductForm( request.POST or None )

    if form.is_valid():
        form.save(commit = False).save()
        return HttpResponseRedirect( '/newProduct' )

    return render_to_response('NewProduct.html',
        locals(),
        context_instance=RequestContext(request))
