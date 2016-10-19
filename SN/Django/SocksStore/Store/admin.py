from django.contrib import admin


from .models import Customer
class CustomerAdmin(admin.ModelAdmin):
    list_display = ["__unicode__", "timestamp", "updated" ]
    class Meta:
        model = Customer

admin.site.register(Customer, CustomerAdmin)


from .models import Product
class ProductAdmin(admin.ModelAdmin):
    list_display = ["__unicode__", "timestamp", "updated" ]
    class Meta:
        model = Product

admin.site.register(Product, ProductAdmin)
