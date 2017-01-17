
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from rest_framework import status
from .models import Ship, Planet, Player, Product
from django.http import Http404
from rest_framework import generics



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
    #success_url = '/thanks/'

# buy Products




