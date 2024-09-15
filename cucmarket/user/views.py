from django.shortcuts import render,redirect
from django.http import JsonResponse,HttpResponseRedirect
from hashlib import sha1
from .models import *
from goods.models import GoodsInfo
from cart.models import CartInfo
from django.shortcuts import render,redirect
from .models import *
from django.conf import settings
# Create your views here.
def login(request):
    uname = request.COOKIES.get('uname','')
    context = {'uname' : uname}
    return render(request,'user/login.html', context)

def login_handle(request):
    post = request.POST
    number = post.get('number')
    password = post.get('password')
    users = UserInfo.objects.filter(number=number)
    print(number)
    if len(users) == 1:
        s1 = sha1()
        s1.update(password.encode('utf8'))
        if s1.hexdigest() == users[0].password:
            red = HttpResponseRedirect('/')
            request.session['user_id'] = users[0].id
            request.session['number'] = number
            request.session['username'] = users[0].username
            return red
        else:
            context = {'title': '用户登录', 'number': number, 'password': password, 'error_msg':'密码错误'}
            return render(request, 'user/login.html', context)
    else:
        context = {'title': '用户登录',  'number': number, 'password': password, 'error_msg':'学号错误'}

        return render(request, 'user/login.html', context)

def logout(request):
    request.session.flush()
    return redirect('/')

def register(request):
    context = {}
    return render(request,'user/register.html',context)

def register_handle(request):
    post = request.POST
    username = post.get('username')
    password = post.get('password')
    password2 = post.get('password2')
    number = post.get('number')
    if password != password2:
        return redirect('/user/register/')
    s1 = sha1()
    s1.update(password.encode('utf8'))
    upwd3 = s1.hexdigest()
    user = UserInfo()
    user.username = username
    user.password = upwd3
    user.number = number
    user.save()
    return redirect('/user/login')

def user_center(request):
    username = request.session.get('username')
    if username == None:
        context = { 'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)
    else:
        user = UserInfo.objects.filter(username=username)[0]
        context = {'user': user}
        return render(request, 'user/user_center.html', context)




from goods.models import GoodsInfo
from django.db import models
from django.contrib.auth.models import User
from django.shortcuts import render


def c_password(request):
    context = {}
    return render(request,'user/c_password.html',context)

def logon_record(request):
    context = {}
    return render(request,'user/logon_record.html',context)



from django.shortcuts import render, redirect
from user.models import UserInfo

def cart(request):
    username = request.session.get('username')
    if not username:
        context = {'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)

    goods_id = request.GET.get('goods_id')
    if not goods_id:
        context = {'error_msg': '商品ID缺失'}
        return render(request, 'user/cart.html', context)

    # 获取商品信息
    good = GoodsInfo.goods.filter(id=goods_id).first()
    if not good:
        context = {'error_msg': '商品不存在'}
        return render(request, 'user/cart.html', context)

    # 获取用户信息
    user = UserInfo.objects.filter(username=username).first()
    if not user:
        context = {'error_msg': '用户不存在'}
        return render(request, 'user/login.html', context)

    # 检查购物车中是否已经存在该商品
    cart_item = CartInfo.objects.filter(buyer=user, good=good).first()
    if not cart_item:
        # 如果购物车中不存在该商品，则添加
        CartInfo.objects.create(
            title=good.title,
            type=good.type,
            picture=good.picture,
            price=good.price,
            buyer=user,
            good=good
        )

    # 重新获取购物车中的商品
    carts = CartInfo.objects.filter(buyer=user)
    total_price = sum(float(cart.price) * int(cart.number) for cart in carts)
    total = sum(int(cart.number) for cart in carts)

    context = {'carts': carts, 'total_price': total_price, 'total': total}
    return render(request, 'user/cart.html', context)

def cart2(request):
    username = request.session.get('username')
    if not username:
        context = {'error_msg': '请先登录'}
        return render(request, 'user/login.html', context)
    user = UserInfo.objects.filter(username=username).first()
    if not user:
        context = {'error_msg': '用户不存在'}
        return render(request, 'user/login.html', context)
    carts = CartInfo.objects.filter(buyer=user)
    total_price = sum(float(cart.price) * int(cart.number) for cart in carts)
    total = sum(int(cart.number) for cart in carts)

    context = {'carts': carts, 'total_price': total_price, 'total': total}
    return render(request, 'user/cart2.html', context)





def delete_cart(request):
    goods_id = request.GET.get('goods_id')
    # 获取购物车中对应商品的购物车项
    cart = CartInfo.objects.filter(good_id=goods_id).first()
    if cart:
        cart.delete()
    username = request.session.get('username')
    user = UserInfo.objects.filter(username=username).first()
    if not user:
        context = {'error_msg': '用户不存在'}
        return render(request, 'user/login.html', context)
    # 获取用户的所有购物车项
    carts = CartInfo.objects.filter(buyer=user)
    total_price = sum(float(cart.price) * int(cart.number) for cart in carts)
    total = sum(int(cart.number) for cart in carts)

    context = {'carts': carts, 'total_price': total_price, 'total': total}
    return render(request, 'user/cart.html', context)

def pay(request):
    username = request.session.get('username')
    user = UserInfo.objects.filter(username=username).first()
    if not user:
        context = {'error_msg': '用户不存在'}
        return render(request, 'user/login.html', context)
    # 获取用户的所有购物车项
    carts = CartInfo.objects.filter(buyer=user)
    # 计算总金额
    total_amount = sum(cart.good.price for cart in carts)
    # 处理结账逻辑（如生成订单等）
    # 删除购物车中的商品并从 GoodsInfo 中删除商品
    for cart in carts:
        good = cart.good
        cart.delete()  # 删除购物车项
        good.delete()  # 删除商品

    context = {
        'total_amount': total_amount,
    }
    return render(request, 'user/pay.html', context)