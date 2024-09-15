from django.contrib import admin

from user.models import UserInfo
from goods.models import GoodsInfo
from cart.models import CartInfo

class CartInfoAdmin(admin.ModelAdmin):
    list_per_pag = 15
    list_display = ['id','title','type','picture','number','price','buyer_id','good_id']
    list_filter = ['buyer_id']
    search_fields = ['buyer_id']

#admin.site.register(CartInfo, CartInfoAdmin)