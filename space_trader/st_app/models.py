from django.db import models
from django.utils import timezone


# Create your models here.

class Player(models.Model):
    nick = models.CharField(max_length=12)
    creation_date = models.DateTimeField(default=timezone.now)
    money = models.IntegerField(null=False)

    def __str__(self):
        return self.nick


class Planet(models.Model):
    planet_name = models.CharField(max_length=12)

    def __str__(self):
        return self.planet_name

class Ship(models.Model):
    ship_name= models.CharField(max_length=12)
    player = models.ForeignKey(Player)
    capacity = models.IntegerField(null=False)
    attack = models.IntegerField(null=False)
    defence = models.IntegerField(null=False)
    speed = models.IntegerField(null=False)
    planet = models.OneToOneField(Planet)

    def __str__(self):
        return self.ship_name


class Product(models.Model):
    product_name = models.CharField(max_length=12)
    how_many_space = models.IntegerField(null=False)
    actual_price = models.IntegerField(null=False)

    def __str__(self):
        return self.product_name
