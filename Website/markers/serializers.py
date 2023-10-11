"""Markers serializers."""

from rest_framework_gis import serializers

from markers.models import Marker, Event, User


class MarkerSerializer(serializers.GeoFeatureModelSerializer):
    """Marker GeoJSON serializer."""

    class Meta:
        """Marker serializer meta class."""

        fields = ("event_name", "year", "country_name", "event_content", "country_id")
        geo_field = "location"
        model = Marker

class EventSerializer(serializers.ModelSerializer):
    """Event serializer."""

    class Meta:
        """Event serializer meta class."""

        fields = ("event_name", "year", "country_name", "event_content", "country_id")
        model = Event

class UserSerializer(serializers.ModelSerializer):
    """User serializer."""

    class Meta:
        """User serializer meta class."""

        fields = ("name", "email", "hashed_password")
        model = User
