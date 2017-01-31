
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import ShipSerializer, PlanetSerializer, PlayerSerializer, ProductSerializer
from django.views.generic.edit import CreateView, DeleteView, UpdateView, FormView
from django.views.generic.list import ListView
from rest_framework import status
from st_app.models import Ship, Planet, Player, Product, PlanetProduct, ShipProduct, Stage, Event, EventEffect
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
        add_stage_one()
        return render(request, 'st_app/description.html')


# add player to stage one


def add_stage_one():
    actual_player=Player.objects.order_by('-creation_date')[0]
    new_stage=Stage.objects.create(player=actual_player)

# new player

class PlayerCreate(CreateView):
    model=Player
    fields=['nick', 'ship']
    template_name='st_app/stage1.html'
    success_url='/desc'

# top 5 players view
class HallOfFameList (View):
    
    def get(self,request):

        d=dict()
        top_5_players = Player.objects.all().order_by('-money')[:5]
        d['top_5_players'] = top_5_players
        return render (request,'st_app/hall_of_fame.html', d)
        


# Random product price on each planet

def product_price():
    planet_count=Planet.objects.count()
    product_count=Product.objects.count()
    price_list=[]

 

    for pl in Planet.objects.all():
        price_product_list=[]
        for pr in Product.objects.all():
            prp=randint(0, 100)
            # pr =randint(0,100)
            price_product_list.append(pl)
            pp, create=PlanetProduct.objects.get_or_create(
                planet=pl, product=pr)
            pp.actual_price=prp
            pp.save()
            print(pp)
    return price_product_list

# print(product_price())

# Buying selling form
class PriceView(View):

    def get(self, request, p_id):

        # run random price
        product_price()
        # download last player data
        p_id=int(p_id)

        d=dict()
        actual_player=Player.objects.order_by('-creation_date')[0]
        player_money=actual_player.money
        ship=actual_player.ship
        ship=Ship.objects.get(ship_name=ship)

        # next rund after checking if it's not the same planet
        next_round()
        # changing player planet
        ship.planet_id=p_id
        ship.save()
        actual_planet=ship.planet
        
        products_onboard=ShipProduct.objects.filter(ship=ship)
        p_onboard=products_onboard.order_by('product__product_name').values_list(
            'product__product_name', 'quantity')
        product_prices=PlanetProduct.objects.filter(planet=actual_planet)
        product_all = Product.objects.all()
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





        d['actual_player'] = actual_player
        d['player_money'] = player_money
        d['ship'] = ship
        d['actual_planet'] = actual_planet
        d['products_onboard'] = products_onboard
        d['product_prices'] = product_prices
        d['actual_capacity'] = actual_capacity 
        d['products_all'] = product_all

        return render(request, 'st_app/stage3_1.html', d)

    def post(self, request, p_id):

        # data before buying/selling
        actual_player=Player.objects.order_by('-creation_date')[0]
        player_money=actual_player.money
        ship=actual_player.ship
        actual_planet=ship.planet
        products_onboard=ShipProduct.objects.filter(ship=ship)
        p_onboard=products_onboard.order_by('product__product_name').values_list(
            'product__product_name', 'quantity')

        product_prices=PlanetProduct.objects.filter(
            planet=actual_planet).values_list('product__product_name', 'actual_price')
        
        # data after buying/selling
        form=request.POST

        print(form)
        # list of changed values
        delta_list_final=[]
        for o in p_onboard:
            delta_list=[]
            delta_list.append(o[0])
            print(delta_list)
            for d in form:
                if o[0] == d:
                    d_to_int=int(form[d])

        # check if not (-) value
                    if d_to_int < 0:
                        return HttpResponse("Nie możesz sprzedać tego, czego nie masz")

                    delta=d_to_int - o[1]
                    # print (delta)
                    delta_list.append(delta)
                    delta_list_final.append(delta_list)
        print (delta_list_final)
        # calculate balance
        balance=0
        for d in delta_list_final:
            # print(d)
            for p in product_prices:
                if p[0] == d[0]:
                    buy_sell=p[1] * d[1]
                    balance += buy_sell
        #print(balance)
        
        # calulate capacity
        standard_ship_capacity = ship.capacity
        products_all_list = list(Product.objects.values_list('product_name', 'how_many_space').all()) 
        capacity_used = 0
        for p in p_onboard:
            for pr in products_all_list:
                if p[0] == pr[0]:
                    used = p[1] * pr[1]
                    capacity_used += used 
        actual_capacity = standard_ship_capacity - capacity_used

        capacity_balance=0
        for d in delta_list_final:
            for p in products_all_list:
                if d[0] == p[0]:
                    buy_sell = d[1] * p[1]
                    capacity_balance += buy_sell
                    
        print (capacity_balance)    
        actual_capacity = actual_capacity - capacity_balance
        print (actual_capacity)
        if actual_capacity > standard_ship_capacity or actual_capacity < 0:
            return HttpResponse('Nie wystarczająco miejsca w ładowni')
            

        # update money in database
        if balance > player_money:
            return HttpResponse('Nie masz wystarczajaco kasy na zakupy')
        else:
            player_money=player_money - balance
            actual_player.money=player_money
            actual_player.save()

            # update stock

            for d in delta_list_final:
                for p in p_onboard:
                    if d[0] == p[0]:
                        new_items=d[1] + p[1]
                        products_onboard, create=ShipProduct.objects.get_or_create(
                            ship__ship_name=ship, product__product_name=p[0])
                        products_onboard.quantity=new_items
                        products_onboard.save()
    # check game over
    
        stage = Stage.objects.filter(player=actual_player)[0].stage_number
        if stage > 20:
            return HttpResponse('Gra skończona')       

        return HttpResponseRedirect('/stage2/')
        # return render(request, 'st_app/stage2.html')


# where are pirates?

def pirates_location():

    planets=Planet.objects.all()
    pirates=choice(planets)
    return pirates
# print(pirates_location())


# next round

def next_round():

    actual_player=Player.objects.order_by('-creation_date')[0]
    last_stage=Stage.objects.get(player=actual_player)
    next_stage=last_stage.stage_number + 1
    last_stage, create=Stage.objects.get_or_create(player=actual_player)
    last_stage.stage_number=next_stage
    last_stage.save()

# next_round()


class PlanetView(View):

    def get(self, request):

        d=dict()
        actual_player=Player.objects.order_by('-creation_date')[0]
        player_money=actual_player.money
        ship=actual_player.ship
        actual_planet=ship.planet
        stage=Stage.objects.filter(player=actual_player)[0].stage_number
        d['stage']=stage
        d['player_money']=player_money
        d['actual_planet']=actual_planet
        return render(request, 'st_app/stage2.html', d)

def random_events():

    number_of_events = Event.objects.all()
    random_event = choice (number_of_events)
    
    return random_event

