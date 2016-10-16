from django.shortcuts import render, render_to_response, RequestContext
from .forms import CustomerForm

def home(request):
    return render_to_response('Home.html',
        locals(),
        context_instance=RequestContext(request))

def newCustomer(request):
    form = CustomerForm( request.POST or None )

    if form.is_valid():
        save_it = form.save(commit = False)
        save_it.save()

    return render_to_response('newCustomer.html',
        locals(),
        context_instance=RequestContext(request))
