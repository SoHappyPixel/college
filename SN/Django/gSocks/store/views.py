from .models import Product
from .forms import ProductForm

from django.shortcuts import render
from django.http import HttpResponseRedirect

from django.views.generic import ListView
from django.views.generic.edit import FormView



def home(request):
    context = { 'welcome' : 'A new reality for your feet !' }
    return render(request,'store/home.html',context)

class list_product(ListView):
    model = Product
    paginate_by = 3
    template_name = 'store/listProducts.html'


class add_product(FormView):
    template_name = 'store/addProducts.html'
    form_class = ProductForm
    success_url = '/succes/'

    def form_valid(self, form):
        # form.save()
        return super(add_product, self).form_valid(form)
