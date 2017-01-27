# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-01-25 09:38
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('st_app', '0002_auto_20170120_2215'),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('event_id', models.IntegerField()),
                ('event_name', models.CharField(max_length=32)),
                ('image', models.ImageField(upload_to='')),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='EventEffect',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stage', models.IntegerField(null=True)),
                ('money', models.IntegerField(null=True)),
                ('event', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='st_app.Event')),
                ('product', models.ManyToManyField(to='st_app.Product')),
            ],
        ),
    ]