from django.urls import path
from . import views

app_name = "templates"   


urlpatterns = [
    path("", views.home, name="home"),

]