from django.test import TestCase
from matplotlib.backend_bases import LocationEvent
from .models import User , Event , Marker

################
# UNIT TESTING #
################
# User tests   #
################
class TestUser(TestCase):
    def setUp(self):
        User.objects.create(name='Nathan', email='abc@def.com',hashed_password="pass")
        User.objects.create(name='Mihai', email='wzy@def.com',hashed_password="pass")
        User.objects.create(name='Andreea', email='efg@def.com',hashed_password="pass")

    #checking Name and email
    def test_user_email(self):
        user_Nathan = User.objects.get(name='Nathan')
        user_Mihai = User.objects.get(name='Mihai')
        user_Andreea = User.objects.get(name='Andreea')

        self.assertEqual(user_Nathan.email, "abc@def.com")
        self.assertEqual(user_Mihai.email, "wyz@def.com")
        self.assertEqual(user_Andreea.email, "efg@def.com")

    # trying a new user 
    def create_user(self):
        response = self.client.post(
            "/users/",
            {"name": "Abbie", "email": "abbie@mail.com",
            "hashed_password": "password"})
        self.assertEqual(response.status_code, 200)
        self.assertTrue(User.objects.filter(name="Abbie",email="abbie@mail.com",hashed_password="password").exists())
        
    # trying new user but it already exists    
    def test_create_esiting_user(self):
        response = self.client.post(
            "/users/",
            {"name": "Nathan", "email": "abc@def.com",
            "hashed_password": "pass"})
        self.assertEqual(response.status_code, 200)
        self.assertTrue(User.objects.filter(name="Nathan",email="abc@def.com",hashed_password="pass").exists())  
###################
# Interactive Map #
###################
class TestMap(TestCase):
    def setUp(self):
        User.objects.create(name='Nathan', email='abc@def.com',hashed_password="pass")
        User.objects.create(name='Mihai', email='wzy@def.com',hashed_password="pass")
        User.objects.create(name='Andreea', email='efg@def.com',hashed_password="pass")

        Event.objects.create(event_name ='WWII Starts', year = 1939)
        Event.objects.create(event_name ='JFK Killed', year = 1963)
        
        Marker.objects.create(event_name='HK returned to China',location = (23,24) , year = 1997)
        Marker.objects.create(event_name='SF Earthquake',location=(1,67) , year = 1906)

    def test_Marker(self):
        response1 = self.client.get(
            "/markers/",
            {"event_name": "HK returned to China", "location": (23,24), "year": 1997})
        response2 = self.client.get(
             "/markers/",
            {"event_name": "SF Earthquake", "location": (1,67), "year": 1906})
        
        self.assertEqual(response1.data, ({"event_name":"HK returned to China"}).data)
        self.assertNotEqual(response1.data, ({"event_name":"SF Earthquake"}).data)
        self.assertEqual(response2.data, ({"event_name":"SF Earthquake"}).data)
        self.assertNotEqual(response2.data, ({"event_name":"HK returned to China"}).data)

    def test_Event(self):
        responseA = self.client.get(
            "/markers/",
            {"event_name": "WWII Starts", "year": 1939})
        responseB = self.client.get(
             "/markers/",
            {"event_name": "JFK Killed","year": 1963})
        
        self.assertEqual(responseA.staus_code, 200)
        self.assertEqual(responseB.staus_code, 200)