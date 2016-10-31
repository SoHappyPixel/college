from django.conf.urls import include, url
from . import views

app_name = 'store'
urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^listProducts/', views.list_product.as_view(), name='listProducts'),
]
