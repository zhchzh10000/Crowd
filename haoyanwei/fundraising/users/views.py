import re
from audioop import reverse

from django.contrib.auth import login, authenticate
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

from django.views.generic.base import View

# Create your views here.
from users.forms import LoginForm,RegisterForm
import json

from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from .models import User


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


"""
用户登录
"""
class UserLogin(View):
    def get(self, request):
        return render(request, "login.html", {})

    def post(self,request):
        print('11111')
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            print('=========')
            username = request.POST.get("username", "")
            password = request.POST.get("password", "")
            user = authenticate(username=username, password=password)
            print(user)
            if user is not None:
                login(request, user)
                return render(request, "index.html")
            else:
                return render(request, "login.html", {"msg": u"用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_form":login_form})


"""
用户注册
"""
class RegisterView(View):
    def get(self,request):
        regist_form =RegisterForm()
        return render(request,"reg.html",{"regist_form":regist_form})
    def post(self, request):
        print('111111')
        #获取网页请求
        regist_form = RegisterForm(request.POST)
        print(regist_form)
        if regist_form.is_valid():
            #获取网页中的email
            user_name = request.POST.get("username", '')
            user_Email = request.POST.get('email', '')
            userpwd = request.POST.get('password', '')
            #实例化UserProfile模块
            users = User()
            #用户名同邮箱相同

            users.username = user_name
            users.email = user_Email
            users.password = make_password(userpwd)
            #存入数据库
            users.save()
            return render(request, "index.html")
        else:
            return render(request, "reg.html", {"regist_form": regist_form})


"""
用户中心我的众筹
"""
class Mycrowdfunding(View):
    def get(self, request):
        return render(request, "minecrowdfunding.html")

