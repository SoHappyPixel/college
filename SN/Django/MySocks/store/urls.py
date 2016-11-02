from . import views
from django.conf.urls import include, url
from django.contrib.auth.views import login

app_name = 'store'

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', views.logout.as_view(), name='logout'),
    url(r'^register/$', views.UserCreate.as_view(), name='user_add'),

    url(r'^product/$', views.ProductList.as_view(), name='product_list'),
    url(r'^product/add/$', views.ProductCreate.as_view(), name='product_add'),
    url(r'^product/(?P<pk>[0-9]+)/$', views.ProductDetail.as_view(), name='product_detail'),
    url(r'^product/(?P<pk>[0-9]+)/update/$', views.ProductUpdate.as_view(), name='product_update'),
    url(r'^product/(?P<pk>[0-9]+)/delete/$', views.ProductDelete.as_view(), name='product_delete'),

]
