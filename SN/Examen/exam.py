#! /usr/bin/python2
# -*- coding: utf-8 -*-
print "EXAMEN_SISTEMAS_NEGOCIO."

# ----------------------------------------------------------------------------
print "\n\n¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦... P1 ...¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦"

#A
print "\n---> A:\n"
c = {}
l = ['a','b','f','f','b','b']
print "lista = {}".format(l)
for x in l:
    c[x] = l.count(x)
print "conteo = {}".format(c)

#B
print "\n\n---> B:\n"
import numpy as np
with open('binum.txt') as f:
    lines = [[int(x) for x in line.split()] for line in f]
multiarray = np.array(lines)
print multiarray

# ----------------------------------------------------------------------------

print "\n\n\n¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦... P2 ...¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦"
import random

#A
print "\n---> A:\n"
print "#... Ver en el script la definición de la clase"

class Employee( object ):
    def __init__( self, first_name, last_name, staff_number ):
        self.first_name = first_name
        self.last_name = last_name
        self.staff_number = staff_number
    def GetEmployee( self ):
        return "This is: '{}, {}' with Staff Number: {}.".format(self.first_name,self.last_name,self.staff_number)

#B
print "\n\n---> B:\n"
print "#... Ver en el script: Numero aleatorio y Creacion de lista.\n"

def RandStaffNum():
    return random.randint(0,100)

E = []
a = Employee("Daniel", "Camba Lamas", RandStaffNum())
E.append(a)
b = Employee("Pepe", "Chiringo", RandStaffNum())
E.append(b)

print "#Mostrando los empleados almacenados en la lista E:\n"
for x in E:
    print "\t{}".format(x.GetEmployee())

# ----------------------------------------------------------------------------

print "\n\n\n¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦... P3 ...¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦"

# A (on the shell)
print "\n---> A:\n"
print "#Usando tu shell favorito, en tu carpeta de desarrollo, haz lo siguiente...\n"
print "\tvirtualenv djangoEnv\n\
\tsource ./djangoEnv/bin/activate\n\
\tpip install django\n\
\tdjango-admin.py startproject SN_Exam\n"

# B
print "\n---> B:\n"
print "#Usando tu shell favorito, en la carpeta de tu proyecto:\n"
print "\tpython2 manage.py startapp\n"

# C
### on the project folder
print "#Usando tu shell favorito, en la carpeta de tu proyecto:\n"
print "\tpython2 manage.py startapp Product_Catalog\n\
\tvim Product_Catalog/models.py\n"

### write the next lines
print "#Escribe las siguientes lineas:\n"

print "\tfrom django.db import models\n\
\tfrom django.core.validators import MinValueValidator\n\
\tclass Product(models.Model):\n\
    \t\tproduct_name        = models.CharField(max_length = 30)\n\
    \t\tprodcut_description = models.CharField(max_length = 200)\n\
    \t\tsales_price         = models.FloatField(validºators=[MinValueValidator(0.0)])\n\
    \t\tpurchase_price      = models.FloatField(validators=[MinValueValidator(0.0)])\n\
    \t\tupdated = models.DateTimeField(auto_now_add=True, auto_now=False)\n\
    \t\ttimestamp = models.DateTimeField(auto_now_add=True, auto_now=False)"
