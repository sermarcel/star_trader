"""space_trader URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from st_app.views import ShipDetail, ShipList, PlanetDetail, PlanetList, PlayerCreate, \
PriceView


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^ship/', ShipList.as_view(), name='ship-list'),
    url(r'^ship/(?P<pk>(\d)+)', ShipDetail.as_view(), name='ship-detail'),
    url(r'^planet/', PlanetList.as_view(), name='planet-list'),
    url(r'^planet/(?P<pk>(\d)+)', PlanetDetail.as_view(), name='planet-detail'),
    url(r'^stage1', PlayerCreate.as_view(), name='new_player-form'),
    url(r'^stage2', PriceView.as_view(), name='product_buy_sell-form'),
    
    
]
