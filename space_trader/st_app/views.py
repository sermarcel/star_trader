
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from rest_framework import status
from st_app.models import Ship, Planet, Player, Product, PlanetProduct, ShipProduct
from django.http import Http404
from rest_framework import generics
from random import randint, choice
from django.forms import formset_factory
from django.views import View



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




# Random product price on each planet

def product_price():
    planet_count=Planet.objects.count()
    product_count=Product.objects.count()
    price_list=[]
    
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
    return price_list 
#print(product_price())

# buying/selling on si  ngle planet: We need quantity, product, price, money        
'''class PriceView(UpdateView):

    model=ShipProduct
    fields=['quantity','product']
    template_name='st_app/stage2.html'
    success_url = '/st_app/main.html'

'''

class PriceView(View):

    def get(self, request):
    # download last player data            
        
        d = dict()

        actual_player = Player.objects.order_by('-creation_date')[0]
        player_money = actual_player.money
        ship = actual_player.ship
        actual_planet = ship.planet
        products_onboard =ShipProduct.objects.filter(ship=ship)
        product_prices=PlanetProduct.objects.filter(planet=actual_planet)



        d['actual_player'] = actual_player
        d['player_money'] = player_money
        d['ship'] = ship
        d['actual_planet'] = actual_planet
        d['products_onboard']=products_onboard
        d['product_prices']=product_prices

        return render(request, 'st_app/stage2.html', d)
        
    def post(self, request):
        pass

# where are pirates?

def pirates_location():

    planets=Planet.objects.all()
    pirates=choice(planets)
    return pirates
#print(pirates_location())




