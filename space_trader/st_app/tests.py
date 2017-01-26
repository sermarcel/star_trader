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



actual_player=Player.objects.order_by('-creation_date')[0]
player_money=actual_player.money
ship=actual_player.ship
ship=Ship.objects.get(ship_name=ship)

# next rund after checking if it's not the same planet
# changing player planet
ship.planet_id=p_id
ship.save()
actual_planet=ship.planet

products_onboard=ShipProduct.objects.filter(ship=ship)
p_onboard=products_onboard.order_by('product__product_name').values_list(
    'product__product_name', 'quantity')
product_prices=PlanetProduct.objects.filter(planet=actual_planet)

# show actual capacity
standard_ship_capacity = ship.capacity
products_all_list = list(Product.objects.values_list('product_name', 'how_many_space').all()) 
capacity_used = 0
for p in p_onboard:
    for pr in products_all_list:
        if p[0] == pr[0]:
            used = p[1] * pr[1]
            capacity_used += used 
actual_capacity = standard_ship_capacity - capacity_used
