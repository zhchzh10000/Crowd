#!/usr/bin/env Python
# coding=utf-8
from django.shortcuts import render, redirect
from django.views.generic.base import View
from .forms import RegisterForm, LoginForm  #form表单验证
from .models import UserProfile
from django.contrib.auth.hashers import make_password    #加密
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponsePermanentRedirect
from django.core.urlresolvers import  reverse


# 登录
class UserLogin(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            value = request.POST.get("value", '')
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    if value == 'member':
                        login(request, user)
                        return redirect(reverse('users:info'))
                    if value == 'user':
                        login(request, user)
                        return redirect(reverse('users:mian'))

                else:
                    return render(request, 'login.html', {'msg': '用户未激活'})
            else:
                return render(request, 'login.html', {'msg': '用户名或者密码错误'})
        else:
            return render(request, 'login.html', {'login_form': login_form})


#注册
class UserRegister(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'reg.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        pre_check = register_form.is_valid()
        if pre_check:
            # 取出email和password
            email = request.POST.get('email', '')
            if UserProfile.objects.filter(email=email):
                return render(request, 'reg.html', {'register_form': register_form,
                                                    'msg': '用户已存在'})
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user_type = request.POST.get("user_type", '')
            print('pass_word======',pass_word)
            '==============='
            print('user_name=====',user_name)


            # 实例化用户，然后赋值
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = email
            # 新建用户为非活跃用户，可通过验证变为活跃用户
            user_profile.is_active = True

            # 将明文转换为密文赋给password
            user_profile.password = make_password(pass_word)
            user_profile.user_type = user_type
            user_profile.save()  # 保存到数据库


            return render(request, "login.html")
        else:
            # form表单验证失败，将错误信息传给前端
            return render(request, "reg.html", {"register_form": register_form})

#注销
class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect(reverse('users:login'))
#会员主页
class UserIifo(View):
    def get(self, request):
        username = request.user
        print(username)
        username_info = UserProfile.objects.get(username=username)
        return render(request, 'member.html',
                      {'username_info': username_info})


#管理员主页
class mianIifoViws(View):
    def get(self, request):
        username = request.user
        username_info = UserProfile.objects.get(username=username)

        return  render(request, 'main.html', {'username_info': username_info})

# 用户消息
class messageViws(View):
    def get(self, request, user_id):

        return render(request, 'message.html')