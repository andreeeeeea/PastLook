"""Markers models."""

#import email
from unicodedata import name
from django.contrib.gis.db import models


class Marker(models.Model):
    """A marker with name and location."""
    country_id = models.IntegerField(null = True)
    event_name = models.CharField(max_length=455)
    location = models.PointField()
    year = models.DateField(null = True)
    country_name = models.CharField(max_length=455, null=True)
    event_content = models.CharField(max_length=1000, null=True)

class Event(models.Model):
    country_id = models.IntegerField(null = True)
    event_name = models.CharField(max_length=455)
    event_content = models.CharField(max_length=1000, null=True)
    year = models.DateField(null = True)
    country_name = models.CharField(max_length=455, null=True)

class User(models.Model):
    name = models.CharField(max_length=455)
    email = models.EmailField(max_length=455)
    hashed_password = models.CharField(max_length=455)