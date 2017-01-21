
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from rest_framework import status
from st_app.models import Ship, Planet, Player, Product, PlanetProduct, ShipProduct, Stage
from django.http import Http404, HttpResponse, HttpResponseRedirect
from rest_framework import generics
from random import randint, choice
from django.forms import formset_factory
from django.views import View
from st_app.forms import ShipProductForm


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

# start game


class StartGame(View):

    def get(self, request):
        return render(request, 'st_app/main.html')

# desccription with Stefan Stage

class DescView(View):

    def get(self, request):
        return render(request, 'st_app/description.html')

  


# new player

class PlayerCreate(CreateView):
    model = Player
    fields = ['nick', 'ship']
    template_name = 'st_app/stage1.html'
    success_url = '/desc'

# add player to stage one


def add_stage_one():
    actual_player = Player.objects.order_by('-creation_date')[0]
    new_stage = Stage.objects.create(player=actual_player)


# Random product price on each planet

def product_price():
    planet_count = Planet.objects.count()
    product_count = Product.objects.count()
    price_list = []

    print(planet_count)
    print(product_count)

    for pl in Planet.objects.all():
        price_product_list = []
        for pr in Product.objects.all():
            prp = randint(0, 100)
            # pr =randint(0,100)
            price_product_list.append(pl)
            pp, create = PlanetProduct.objects.get_or_create(
                planet=pl, product=pr)
            pp.actual_price = prp
            pp.save()
            print(pp)
    return price_product_list

# print(product_price())


# Buying selling form
class PriceView(View):

    def get(self, request, p_id):

        # download last player data
        d = dict()

        actual_player = Player.objects.order_by('-creation_date')[0]
        player_money = actual_player.money
        ship = actual_player.ship
        ship=Ship.objects.get(ship_name=ship)
            # changing player planet
        ship.planet_id=p_id
        ship.save()
      
        actual_planet = ship.planet
        
        products_onboard = ShipProduct.objects.filter(ship=ship)
        product_prices = PlanetProduct.objects.filter(planet=actual_planet)

        d['actual_player'] = actual_player
        d['player_money'] = player_money
        d['ship'] = ship
        d['actual_planet'] = actual_planet
        d['products_onboard'] = products_onboard
        d['product_prices'] = product_prices

        return render(request, 'st_app/stage3_1.html', d)

    def post(self, request, p_id):

        # data before buying/selling
        actual_player = Player.objects.order_by('-creation_date')[0]
        player_money = actual_player.money
        ship = actual_player.ship
        actual_planet = ship.planet
        products_onboard = ShipProduct.objects.filter(ship=ship)
        p_onboard = products_onboard.order_by('product__product_name').values_list(
            'product__product_name', 'quantity')

        product_prices = PlanetProduct.objects.filter(
            planet=actual_planet).values_list('product__product_name', 'actual_price')

        # data after buying/selling
        form = request.POST

        print(form)
        # list of changed values
        delta_list_final = []
        for o in p_onboard:
            delta_list = []
            delta_list.append(o[0])
            print(delta_list)
            for d in form:
                if o[0] == d:
                    d_to_int = int(form[d])

        # check if not (-) value
                    if d_to_int < 0:
                        return HttpResponse("Nie możesz sprzedać tego, czego nie masz")

                    delta = d_to_int - o[1]
                    #print (delta)
                    delta_list.append(delta)
                    delta_list_final.append(delta_list)

        # print(delta_list_final)
        #print (product_prices)
        balance = 0
        for d in delta_list_final:
            # print(d)
            for p in product_prices:
                if p[0] == d[0]:
                    buy_sell = p[1] * d[1]
                    #print (buy_sell)
                # if d[0]==p[1]:
                    balance += buy_sell
        print(balance)
        #print(player_money)

        # update money in database
        if balance > player_money:
            return HttpResponse('Nie masz wystarczajaco kasy na zakupy')
        else:
            player_money = player_money - balance
            actual_player, create = Player.objects.get_or_create(nick=actual_player)
            actual_player.money = player_money
            actual_player.save()

            # update stock
            #print(delta_list_final)
            #print(p_onboard)

            for d in delta_list_final:
                for p in p_onboard:
                    if d[0] == p[0]:
                        new_items = d[1] + p[1]
                        products_onboard, create = ShipProduct.objects.get_or_create(
                            ship__ship_name=ship, product__product_name=p[0])
                        products_onboard.quantity = new_items
                        products_onboard.save()
                        #print(new_items)

    
        return HttpResponseRedirect('/stage2/')
        #return render(request, 'st_app/stage2.html')


# where are pirates?

def pirates_location():

    planets = Planet.objects.all()
    pirates = choice(planets)
    return pirates
# print(pirates_location())


# next round

def next_round():

    actual_player = Player.objects.order_by('-creation_date')[0]
    last_stage = Stage.objects.get(player=actual_player)
    next_stage = last_stage.stage_number + 1
    last_stage, create = Stage.objects.get_or_create(player=actual_player)
    last_stage.stage_number = next_stage
    last_stage.save()

# next_round()


class PlanetView(View):

    def get(self, request):
        
        d = dict()
        actual_player = Player.objects.order_by('-creation_date')[0]
        player_money = actual_player.money
        ship = actual_player.ship
        actual_planet = ship.planet
        d['player_money']=player_money
        d['actual_planet']=actual_planet
        return render(request, 'st_app/stage2.html', d)

