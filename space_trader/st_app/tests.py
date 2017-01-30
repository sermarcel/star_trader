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


def random_events():

number_of_events = Event.objects.all()
random_event = choice (number_of_events)
    
    return random_event

print (random_events)
