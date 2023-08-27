from django.conf.urls import url
from django.test import SimpleTestCase, TestCase, Client
from django.urls import reverse, resolve
from .views import contact,order_plan, login_user
from .models import Contact_Us
from admins.models import InternetOutage
class TestUrls(SimpleTestCase):
    def test_contact(self):
        url = reverse('about')
        self.assertEquals(resolve(url).func, contact)

    def test_services(self):
        url = reverse('services')
        self.assertEquals(resolve(url).func, order_plan)

    def test_login(self):
        url = reverse('login')
        self.assertEquals(resolve(url).func, login_user)

class TestViews(TestCase):
    def setUp(self):
        self.client = Client()
        self.login_user = reverse('login')
        self.contact = reverse('contact')
    def test_login_user(self):
        response = self.client.get(self.login_user)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/login.html')
    def test_contact(self):
        response = self.client.get(self.contact)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/contact.html')

class TestModels(TestCase):
    def setUp(self):
        self.contact_us = Contact_Us.objects.create(
            first_name='prabesh',
            last_name="aryal"
        )
        self.profile = InternetOutage.objects.create(
            notice_title='Maitidevi',
            notice_description="Outage",
        )
    def test_contact_us(self):
        self.assertEquals(self.contact_us.first_name, 'prabesh')
    def test_profile(self):
        self.assertEquals(self.profile.notice_title, 'Maitidevi')