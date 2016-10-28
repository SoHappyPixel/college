from django.db import models
from django.utils.encoding import smart_unicode


class Customer(models.Model):
    name = models.CharField(max_length=100)
    surname = models.CharField(max_length=100)
    email = models.EmailField(primary_key=True,max_length=100)
    password = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    address = models.CharField(max_length=100)

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)

    def __unicode__(self) :
        return smart_unicode(self.email)


class Product(models.Model):
    brand = models.CharField(max_length=120, null=False,blank=True)
    thickness = models.IntegerField(null=False, blank=True)
    color = models.CharField(max_length=120, null=False, blank=True)
    height = models.IntegerField(null=False, blank=True)
    cost = models.DecimalField(max_digits=3, decimal_places=2, null=False, blank=True)
    printed = models.CharField(max_length=120, null=False, blank=True)

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)

    def __unicode__(self) :
        return smart_unicode( self.brand + self.printed )
