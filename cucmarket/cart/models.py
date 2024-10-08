from django.db import models
from user.models import UserInfo
from goods.models import GoodsInfo

# Create your models here.
class CartInfo(models.Model):
    id = models.AutoField(primary_key = True) 
    title = models.CharField(max_length=20)  #名称
    type = models.CharField(max_length=20)  # 类型
    picture = models.ImageField(upload_to='goods',default='')  #图片
    number = models.IntegerField( default=1)  # 数量
    price = models.DecimalField(max_digits=10,decimal_places=2) #价格
    buyer = models.ForeignKey(UserInfo, on_delete=models.CASCADE) # 买家Id
    good = models.ForeignKey(GoodsInfo, on_delete=models.CASCADE)  # 商品ID