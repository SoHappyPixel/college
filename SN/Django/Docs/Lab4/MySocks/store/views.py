from .models import Product
from .forms import SignupForm

from django.shortcuts import render
from django.core.urlresolvers import reverse_lazy

from django.contrib.auth.models import User
from django.contrib.auth import logout as auth_logout

from django.views.generic import ListView, DetailView, RedirectView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin



# CLASS-BASED VIEWS.

# ... User
class UserCreate(CreateView):
    model = User
    form_class = SignupForm
    success_url = reverse_lazy('store:product_list')

    def get_context_data(self, **args):
        context = super(UserCreate, self).get_context_data(**args)
        context.update( { 'title':'NEW USER!' } )
        return context


# ... Product
class ProductList(LoginRequiredMixin, ListView):
    model = Product
    paginate_by = 3
    login_url = '/store/login/'

    def get_context_data(self, **args):
        context = super(ProductList, self).get_context_data(**args)
        context.update( { 'title':'ALL OUR SOCKS!' } )
        return context

class ProductDetail(LoginRequiredMixin, DetailView):
    model = Product
    login_url = '/store/login/'

    def get_context_data(self, **args):
        context = super(ProductDetail, self).get_context_data(**args)
        context.update( { 'title':'SOCK DETAILS!' } )
        return context

class ProductCreate(PermissionRequiredMixin, LoginRequiredMixin, CreateView):
    model = Product
    login_url = '/store/login/'
    permission_required = 'product.can_add'
    success_url = reverse_lazy('store:product_list')
    fields = ['name', 'brand', 'thickness', 'color', 'height', 'cost', 'printed']

    def get_context_data(self, **args):
        context = super(ProductCreate, self).get_context_data(**args)
        context.update( { 'title':'ADD NEW SOCK!' } )
        return context

class ProductUpdate(PermissionRequiredMixin, LoginRequiredMixin, UpdateView):
    model = Product
    login_url = '/store/login/'
    permission_required = 'product.can_change'
    success_url = reverse_lazy('store:product_list')
    fields = ['name', 'brand', 'thickness', 'color', 'height', 'cost', 'printed']

    def get_context_data(self, **args):
        context = super(ProductUpdate, self).get_context_data(**args)
        context.update( { 'title':'MODIFY SOCK!' } )
        return context


class ProductDelete(PermissionRequiredMixin, LoginRequiredMixin, DeleteView):
    model = Product
    login_url = '/store/login/'
    permission_required = 'product.can_delete'
    success_url = reverse_lazy('store:product_list')

    def get_context_data(self, **args):
        context = super(ProductDelete, self).get_context_data(**args)
        context.update( { 'title':'DELETE SOCK!!!' } )
        return context


# FUNTIONS VIEWS

def home(request):
    context = { 'welcome' : 'Warm your feet!' }
    return render(request,'store/home.html',context)
class logout(RedirectView):
    url = '/'
    def get(self, request, *args, **kwargs):
        auth_logout(request)
        return super(logout, self).get(request, *args, **kwargs)
