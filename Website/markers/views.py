"""MarkersMap view, AddEventMapView, Event ViewSet and User ViewSet"""
from rest_framework import viewsets
from django.views.generic.base import TemplateView
from markers.models import Marker, Event, User
from markers.serializers import EventSerializer,UserSerializer
# to add descriptions in API documention 
from drf_yasg import openapi
from drf_yasg.app_settings import swagger_settings
from drf_yasg.inspectors import CoreAPICompatInspector, FieldInspector, NotHandled, SwaggerAutoSchema
from drf_yasg.utils import swagger_auto_schema 
#for authentication
from rest_framework.permissions import IsAuthenticated 

class MarkersMapView(TemplateView):
    """Markers map view."""
    template_name = "map.html"
class AddEventMapView(TemplateView):
    template_name = "addevent.html"

'''@method_decorator(name='list', decorator=swagger_auto_schema(
    operation_description="description from swagger_auto_schema via method_decorator",
    filter_inspectors=[DjangoFilterDescriptionInspector],
))'''
class EventViewSet(viewsets.ModelViewSet):
    """An event denotes an historical event happend in one particular country in certain year."""
    permission_classes = (IsAuthenticated,)
    queryset = Event.objects.all()
    serializer_class = EventSerializer

class UserViewSet(viewsets.ModelViewSet):
    """A user account. Token authentication is used to view the api of users."""
    permission_classes = (IsAuthenticated,) 
    queryset = User.objects.all()
    serializer_class = UserSerializer
