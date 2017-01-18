from django.test import TestCase
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from rest_framework import status
from st_app.models import Ship, Planet, Player, Product
from django.http import Http404
from rest_framework import generics
from random import randint
from space_trader.settings import os,sys


# Create your tests here.



def env(fun):
    def _fun_wrap(*args, **kwargs):
        import os
        import sys

        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "%s.settings" % SETTINGS_PATH)
        sys.path.append(DJANGO_PATH)

        return fun(*args, **kwargs)

    return _fun_wrap


@env
def product_price():
    planet_count=Planet.objects.count()
    product_count=Product.objects.count()
    price_list=[]
    for pl in range (1, planet_count):
        for pr in range(1, product_count):
            pl =randint(1,100)
            pr =randint(1,100)
            price_list.append([pl,pr])
            
    return price_list
    # planet=Planet.objects.get(pk=id_planet)
    # product=Product.objects.get(pk=id_price)
    #return 'Dla planety {} cena produktu {} wynosi {}'.format(planet, product, price)
    
print(product_price())
