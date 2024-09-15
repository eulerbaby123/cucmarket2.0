from django.db import models

# Create your models here.
class UserInfo(models.Model):
    id = models.AutoField(primary_key = True) 
    username = models.CharField(max_length=20)
    password = models.CharField(max_length=40)
    number = models.CharField(max_length=30,default='')

