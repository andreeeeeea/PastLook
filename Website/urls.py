from django.contrib import admin
from django.urls import include , re_path, path
from rest_framework import routers
from rest_framework.decorators import api_view
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

from app.views import (
    DefaultFeedbackView,
    DefaultSignUpView,
    DefaultLogInView,
    GDPRView,
)


from markers.views import EventViewSet
router = routers.DefaultRouter()
router.register(r'events', EventViewSet)

from markers.views import UserViewSet
router_u = routers.DefaultRouter()
router_u.register(r'users', UserViewSet)

# for REST API documentation
schema_view = get_schema_view(
   openapi.Info(
      title="PastLook API",
      default_version='v1',
      description='''This is the API documentation for PastLook.
      PastLook is an interactive map to gain information of historical events for countries. 
      If you are interested in it , get started at https://pastlook.site/. 
      The REST API for PastLook can be found at https://pastlook.site/api/v1''',
      terms_of_service="https://www.google.com/policies/terms/",
      contact=openapi.Contact(email="contact@team20-21.local"),
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=[permissions.AllowAny],
)


urlpatterns = [
    path('', include('app.urls'),name="app"),
    re_path(r"^feedback$", DefaultFeedbackView.as_view(), name="Feedback"),
    re_path(r"^gdpr$", GDPRView.as_view(), name="GDPR"),
    path("admin/", admin.site.urls),
    path("markers/", include("markers.urls")),
    path("api/v1/", include("markers.api")),
    path('api/v1/', include(router.urls)),
    path('api/v1/', include(router_u.urls)),
    # FOR REST API documentation
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]





