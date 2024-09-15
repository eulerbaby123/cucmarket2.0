from django.contrib import admin 
from goods.models import GoodsInfo

# Register your models here.
class GoodsInfoAdmin(admin.ModelAdmin):
    list_per_pag=15
    list_display = ['id','title','type','picture','price','address','description']
    list_filter = ['title']
    search_fields = ['title']

admin.site.register(GoodsInfo, GoodsInfoAdmin)