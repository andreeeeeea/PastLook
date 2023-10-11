"""Markers admin."""

from django.contrib.gis import admin

from markers.models import Marker, Event


@admin.register(Marker)
class MarkerAdmin(admin.OSMGeoAdmin):
    """Marker admin."""
    list_display = ("country_id","event_name", "location", "year", "country_name", "event_content")
