# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-01-25 16:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('st_app', '0005_auto_20170125_0945'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventeffect',
            name='product',
            field=models.ManyToManyField(blank=True, to='st_app.Product'),
        ),
    ]