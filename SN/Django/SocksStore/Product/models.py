from django.db import models


class Product(models.Model):

    brand = models.CharField(max_length=120, null=False,blank=True)
    thickness = models.IntegerField(null=False, blank=True)
    color = models.CharField(max_length=120, null=False, blank=True)
    height = models.IntegerField(null=False, blank=True)
    cost = models.DecimalField(max_digits=3, decimal_places=2, null=False, blank=True)
    printed = models.CharField(max_length=120, null=False, blank=True)

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)
