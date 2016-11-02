from django.contrib.auth.models import User
from django.core.validators import MinValueValidator
from django.urls import reverse
from django.db import models

class Product(models.Model):

    MID_TEXT_SIZE = 150
    LOW_TEXT_SIZE = 20

    THICKNESS_CHOICES = (
        ('Thick', 'Thick'),
        ('Thin', 'Thin'),
    )

    HEIGHT_CHOICES = (
        ('High', 'High'),
        ('Mid', 'Mid'),
        ('Low', 'Low'),
    )

    name = models.CharField(max_length = MID_TEXT_SIZE)
    brand = models.CharField(max_length = MID_TEXT_SIZE)
    color = models.CharField(max_length = MID_TEXT_SIZE)
    printed = models.CharField(max_length = MID_TEXT_SIZE)
    height = models.CharField(max_length=LOW_TEXT_SIZE, choices=HEIGHT_CHOICES)
    thickness = models.CharField(max_length=LOW_TEXT_SIZE, choices=THICKNESS_CHOICES)
    cost = models.FloatField(validators=[MinValueValidator(0.0)])

    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)

    def get_absolute_url(self):
        return reverse('product_detail', kwargs={'pk': self.pk})


# class Cart(models.Model):
#     user = models.ForeignKey(User, related_name='+')
#     item = models.ForeignKey(Product)
#
#     timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
#     updated = models.DateTimeField(auto_now_add=True, auto_now=False)
#
#     def get_absolute_url(self):
#         return reverse('cart_view', kwargs={'pk': self.pk})
