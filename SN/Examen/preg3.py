# A (on the shell)
virtualenv djangoEnv
source ./djangoEnv/bin/activate
pip install django
django-admin.py startproject SN_Exam

# B
cd SN_Exam
python2 manage.py startapp

# C
### on the project folder
python2 manage.py startapp Product_Catalog
vim Product_Catalog/models.py

### write the next lines
from django.db import models
from django.core.validators import MinValueValidator

class Product(models.Model):
    product_name        = models.CharField(max_length = 30)
    prodcut_description = models.CharField(max_length = 200)
    sales_price         = models.FloatField(validºators=[MinValueValidator(0.0)])
    purchase_price      = models.FloatField(validators=[MinValueValidator(0.0)])
    updated = models.DateTimeField(auto_now_add=True, auto_now=False)
    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
