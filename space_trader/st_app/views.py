
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from rest_framework import status
from st_app.models import Ship, Planet, Player, Product, PlanetProduct
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
    #pp=PlanetProduct.objects.get(pk=2)
    

 #   print (pp)
    print (planet_count)
    print (product_count)
    
    
    for pl in  Planet.objects.all():
        price_product_list=[]
        for pr in Product.objects.all() :
            prp = randint(0,100)
            # pr =randint(0,100)
            price_product_list.append(pl)
            pp, create = PlanetProduct.objects.get_or_create(planet=pl, product=pr)
            pp.actual_price=prp
            pp.save()   
            print(pp)       
           # price_list[pl].append([pr])
    return price_list 
        # price_list.append(price_product_list)
    # print(price_list[1][1])   
    

#print(product_price())









