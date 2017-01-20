from django.db import models
from django.utils import timezone


# Create your models here.

class Player(models.Model):
    nick = models.CharField(max_length=12)
    creation_date = models.DateTimeField(default=timezone.now)
    money = models.IntegerField(null=False, default=100)
    ship = models.ForeignKey('Ship')
   

    def __str__(self):
        return self.nick


class Planet(models.Model):
    planet_name = models.CharField(max_length=12)
    product = models.ManyToManyField('Product', through='PlanetProduct')


    def __str__(self):
        return self.planet_name

class Ship(models.Model):
    ship_name= models.CharField(max_length=12)
    capacity = models.IntegerField(null=False)
    attack = models.IntegerField(null=False)
    defence = models.IntegerField(null=False)
    speed = models.IntegerField(null=False)
    planet = models.ForeignKey(Planet)
    product=models.ManyToManyField('Product', through='ShipProduct' )

    def __str__(self):
        return self.ship_name


class Product(models.Model):
    product_name = models.CharField(max_length=12)
    how_many_space = models.IntegerField(null=False)

    def __str__(self):
        return self.product_name

class PlanetProduct(models.Model):
    planet=models.ForeignKey(Planet)
    product=models.ForeignKey(Product)
    actual_price=models.IntegerField(null=True)

    def __str__(self):
        
        return '{} {} {}'.format(self.planet, self.product, self.actual_price)


class ShipProduct(models.Model):
    ship=models.ForeignKey(Ship)
    product=models.ForeignKey(Product)
    quantity=models.IntegerField(default=0)

    def __str__(self):
        
        return '{} {} {}'.format(self.ship, self.product, self.quantity)

class Stage (models.Model):
    stage_number = models.IntegerField(default=1)
    player = models.ForeignKey(Player)

    def __str__(self):
        return 'Player {} is on stage {}'.format(self.player, self.stage_number)



