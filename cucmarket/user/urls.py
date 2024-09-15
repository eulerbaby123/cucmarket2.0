from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('register_handle/', views.register_handle, name='register_handle'),
    path('login_handle/', views.login_handle, name='login_handle'),
    path('logout/', views.logout, name='logout'),
    path('user_center/', views.user_center, name='user_center'),

    path('c_password/', views.c_password, name='c_password'),
    path('cart/', views.cart, name='cart'),

    path('cart2/', views.cart2, name='cart2'),
    path('delete_cart/', views.delete_cart, name='delete_cart'),
    path('pay/', views.pay, name='pay'),
]