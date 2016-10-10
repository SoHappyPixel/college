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
