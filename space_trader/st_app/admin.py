from django.contrib import admin
from st_app.models import Player, Ship, Product, Planet, PlanetProduct, ShipProduct,Stage

@admin.register(Player)
class PlayerAdmin(admin.ModelAdmin):
    
    list_display =('nick',)


@admin.register(Planet)
class PlanetAdmin(admin.ModelAdmin):
    
    list_display =('planet_name',)


@admin.register(Ship)
class ShipAdmin(admin.ModelAdmin):
    
    list_display =('ship_name',)

@admin.register(PlanetProduct)
class PlanetProductAdmin(admin.ModelAdmin):
    
    list_display =('planet','product', 'actual_price')

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    
    list_display =('product_name',)

@admin.register(ShipProduct)
class ShipProductAdmin(admin.ModelAdmin):
    
    list_display =('ship','product', 'quantity')

@admin.register(Stage)
class StageAdmin(admin.ModelAdmin):
    
    list_display =('player','stage_number')