from . import views
from django.urls import path



urlpatterns = [

    path('', views.index),
    path('books_list/', views.books_list),
    path('digital_list/', views.digital_list),
    path('cloth_list/', views.cloth_list),
    path('traffic_list/', views.traffic_list),
    path('daily_list/', views.daily_list),
    path('other_list/', views.other_list),

    path('release_goods/', views.release_goods),
    path('release/', views.release),
    path('goods_details/', views.goods_details),

    path('after_search/', views.after_search)
]