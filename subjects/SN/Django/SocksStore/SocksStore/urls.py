from django.conf import settings
from django.contrib import admin
from django.conf.urls.static import static
from django.conf.urls import patterns, include, url

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    # url(r'^ecom/', 'Customer.views.ecom', name='ecom'),
    url(r'^$', 'Customer.views.home', name='home'),
    url(r'^newCustomer/', 'Customer.views.newCustomer', name='newCustomer'),
    url(r'^newProduct/', 'Product.views.newProduct', name='newProduct'),
)


if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
            document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL,
            document_root=settings.MEDIA_ROOT)
