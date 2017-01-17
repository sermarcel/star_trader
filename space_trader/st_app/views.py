
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from rest_framework import status
from .models import Ship, Planet, Player, Product
from django.http import Http404
from rest_framework import generics
# Create your views here.


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

