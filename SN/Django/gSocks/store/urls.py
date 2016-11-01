from django.conf.urls import include, url
from . import views

app_name = 'store'
urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^product/$', views.ProductList.as_view(), name='product-list'),
    url(r'^product/(?P<pk>[0-9]+)/$', views.ProductDetail.as_view(), name='product-detail'),
    url(r'^product/add/$', views.ProductCreate.as_view(), name='product-add'),
    url(r'^product/(?P<pk>[0-9]+)/update/$', views.ProductUpdate.as_view(), name='product-update'),
    url(r'^product/(?P<pk>[0-9]+)/delete/$', views.ProductDelete.as_view(), name='product-delete'),
]
