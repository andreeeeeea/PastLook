"""Markers urls."""

from django.urls import path

from markers.views import MarkersMapView, EventViewSet,AddEventMapView

app_name = "markers"

urlpatterns = [
    path("map/", MarkersMapView.as_view()),
    path("addevent/", AddEventMapView.as_view()),
]
