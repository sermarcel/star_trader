from .models import Ship, Planet, PlanetProduct, Player, Product
from rest_framework import serializers

class ShipSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = Ship
        fields = '__all__'

class PlanetSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = Planet
        fields = '__all__'

class PlayerSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = Player
        fields = '__all__'

class ProductSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = Product
        fields = '__all__'