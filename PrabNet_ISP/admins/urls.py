from django.urls import path
from . import views
urlpatterns =[
    path('admin_dashboard', views.dashboard),

    path('plan_request', views.plan_request),
    path('delete_plan_request/<int:request_id>', views.delete_plan_request),

    path('internet_outage_form', views.internet_outage_form),
    path('get_internet_outage', views.get_internet_outage),
    path('delete_internet_outage/<int:notice_id>', views.delete_internet_outage),
    path('update_internet_outage/<int:notice_id>', views.update_internet_outage),

    path('get_internet_outage_user', views.show_internet_outage),
    path('feedback', views.feedbacks),

    path('users', views.show_users),
    path('staffs', views.show_staffs),
    path('promote/<int:user_id>', views.promote_user),
    path('delete_user/<int:user_id>', views.delete_user),
    path('delete_staff/<int:user_id>', views.delete_staff),
    path('demote/<int:user_id>', views.demote_staff),

    path('register', views.register_user),
]

