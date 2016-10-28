from django import forms


from .models import Customer
class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        widgets = { 'password': forms.PasswordInput(), }


from .models import Product
class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
