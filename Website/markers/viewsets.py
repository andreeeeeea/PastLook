"""Markers API viewSet."""
from rest_framework import viewsets
from rest_framework_gis import filters

from markers.models import Marker
from markers.serializers import MarkerSerializer


class MarkerViewSet(viewsets.ModelViewSet):
    """A marker denotes a country on the map."""

    bbox_filter_field = "location"
    filter_backends = (filters.InBBoxFilter,)
    queryset = Marker.objects.all()
    serializer_class = MarkerSerializer
