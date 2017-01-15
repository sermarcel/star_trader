from django.db import models


# Create your models here.
'''
class Player(models.Model):
    nick = models.CharField(max_length=12)
    creation_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.nick

class Ship(models.Model):
    player=models.ForeignKey(Player)
    capacity
    attack
    defence
    speed

class Planet(models.Model):
    pass


class Product(models.Model):
'''
    