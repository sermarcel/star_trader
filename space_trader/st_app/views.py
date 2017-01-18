
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



# Serializers


class ShipList(generics.ListCreateAPIView):
    queryset = Ship.objects.all()
    serializer_class = ShipSerializer

class ShipDetail(generics.RetrieveDestroyAPIView):
    queryset = Ship.objects.all()
    serializer_class = ShipSerializer

class PlanetList(generics.ListCreateAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer

class PlanetDetail(generics.RetrieveDestroyAPIView):
    queryset = Planet.objects.all()
    serializer_class = PlanetSerializer

class PlayerList(generics.ListCreateAPIView):
    queryset = Player.objects.all()
    serializer_class = PlayerSerializer

class PlayerDetail(generics.RetrieveDestroyAPIView):
    queryset = Player.objects.all()
    serializer_class = PlayerSerializer

class ProductList(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

class ProductDetail(generics.RetrieveDestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

# new player

class PlayerCreate(CreateView):
    model = Player
    fields = ['nick', 'ship']
    template_name='st_app/stage1.html'
    success_url = '/st_app/main.html'

# Product price on each planet

def product_price():
    planet_count=Planet.objects.count()
    product_count=Product.objects.count()
    price_list=[]
    
    print (product_count)
    print (planet_count)
    
    for pl in range (0, planet_count):
        price_product_list=[]
        for pr in range(0, product_count):
            pl =randint(0,100)
            pr =randint(0,100)
            price_product_list.append(pl)
           # price_list[pl].append([pr])
        price_list.append(price_product_list)
    print(price_list[1][1])       
    return price_list
    # planet=Planet.objects.get(pk=id_planet)
    # product=Product.objects.get(pk=id_price)
    #return 'Dla planety {} cena produktu {} wynosi {}'.format(planet, product, price)
    
print(product_price())









