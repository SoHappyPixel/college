from django.contrib.auth.models import User
from django.urls import reverse
from django.db import models

TEXT_SIZE = 150

THICKNESS_CHOICES = (
    ('0', 'Thick'),
    ('1', 'Thin'),
)

HEIGHT_CHOICES = (
    ('0', 'High'),
    ('1', 'Mid'),
    ('2', 'Low'),
)

class Product(models.Model):
    name = models.CharField(max_length = TEXT_SIZE)
    brand = models.CharField(max_length = TEXT_SIZE)
    color = models.CharField(max_length = TEXT_SIZE)
    printed = models.CharField(max_length = TEXT_SIZE)
    height = models.CharField(max_length=1, choices=HEIGHT_CHOICES)
    thickness = models.CharField(max_length=1, choices=THICKNESS_CHOICES)
    cost = models.DecimalField(max_digits = 3, decimal_places = 2)

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)

    def get_absolute_url(self):
        return reverse('product_detail', kwargs={'pk': self.pk})


class Cart(models.Model):
    user = models.ForeignKey(User, related_name='+')
    item = models.ForeignKey(Product)

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)

    def get_absolute_url(self):
        return reverse('cart_view', kwargs={'pk': self.pk})
