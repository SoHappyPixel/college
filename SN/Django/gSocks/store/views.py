from .models import Product
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView

def home(request):
    context = { 'welcome' : 'A new reality for your feet !' }
    return render(request,'store/home.html',context)

class ProductList(ListView):
    model = Product
    paginate_by = 3
    template_name = 'store/listProducts.html'

class ProductDetail(DetailView):
    model = Product
    paginate_by = 3
    template_name = 'store/listProducts.html'

class ProductCreate(CreateView):
    model = Product
    fields = ['brand', 'thickness', 'color', 'height', 'cost', 'printed']

class ProductUpdate(UpdateView):
    model = Product
    fields = ['brand', 'thickness', 'color', 'height', 'cost', 'printed']

class ProductDelete(DeleteView):
    model = Product
    success_url = reverse_lazy('product-list')
