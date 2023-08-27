from django.urls import path, include

urlpatterns = [
    path('', include('accounts.urls')),
    path('admins/', include('admins.urls')),
    path('users/', include('users.urls')),
    path('internet/', include('internet.urls')),
    path('store/', include('store.urls')),
]

