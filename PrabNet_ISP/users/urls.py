from django.urls import path
from . import views
urlpatterns =[
    path('dashboard', views.dashboard),
    path('profile', views.profile),
    path('change_user_password', views.change_user_password),
    path('update_details', views.update_details),

]
