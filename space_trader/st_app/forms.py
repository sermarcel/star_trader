from st_app.models import Ship, Planet, Player, Product, PlanetProduct, ShipProduct, Stage
from django import forms
from django.core.exceptions import ValidationError
from django.forms import ModelForm, Textarea, CheckboxSelectMultiple, SelectMultiple
from django.utils import timezone

class ShipProductForm(ModelForm):
    class Meta:
        model = ShipProduct
        fields = '__all__' 