import json
from django.http import HttpResponse, HttpResponsePermanentRedirect
from .email_send import *
from django.http import JsonResponse,HttpResponse
from itsdangerous import SignatureExpired
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.shortcuts import render,redirect
from django.views.generic.base import View
from django.core.urlresolvers import reverse
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from django.conf import settings
from .forms import *
from utils.get_hash import *
from django.contrib.auth.hashers import make_password,check_password
from django.contrib.auth import authenticate, login,logout
# Create your views here.
class IndexView(View):
    def get(self,request):
        return render(request,'index.html')

'''登陆'''

class UserLogin(View):
    def get(self, request):
        return render(request, "login.html", {})

    def post(self, request, jres=None):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get("username", "")
            password = request.POST.get("password", "")
            remember = request.POST.get("remember", "")
            type = request.POST.get('type','')
            # user = UserProfile.objects.get(username=username,password=password)
            # if user:
            #     if remember == 'true':
            #         jres.set_cookie('username', username, max_age=7 * 24 * 3600)
            #     else:
            #         jres.delete_cookie('username')
            #
            #     request.session['islogin'] = True
            #     request.session['username'] = username
            #     request.session['user_id'] = user.id
            #     return jres
            user = authenticate(username=username, password=password)
            if user is not None:
               if user.is_active:
                   if type == '会员':
                        login(request, user)
                        return render(request, "member.html")
                   else:
                        login(request, user)
                        return render(request, "main.html")
               else:
                   return render(request,'login.html',{"msg":"用户没有激活，请进入邮箱激活"})
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_form": login_form})



'''注册'''
class RegistView(View):
    def get(self, request):
        regist_form = RegisterForm()
        return render(request, "reg.html", {"regist_form": regist_form})

    def post(self, request):
        regist_form = RegisterForm(request.POST)
        if regist_form.is_valid():
            user_name = request.POST.get("username", "")
            email = request.POST.get("email", "")
            if UserProfile.objects.filter(username=user_name):
                return render(request, "reg.html", {"regist_form": regist_form, "msg": "用户已经存在"})
            password = request.POST.get("password", "")
            user_type = request.POST.get("usertype","")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = email
            user_profile.password = make_password(password)
            user_profile.usertype = user_type
            user_profile.is_active = False
            user_profile.save()
            send_register_email(email,'register')
            return redirect(reverse('user:login'))
        else:
            return render(request, "reg.html", {"regist_form": regist_form})


class LogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponsePermanentRedirect(reverse('user:index'))


'''邮件激活'''
class AciveUserView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, "active_fail.html")
        return render(request, "login.html")

class MemberView(View):
    def get(self,request):
        return render(request,'member.html')

class MyCrowdView(View):
    def get(self,request):
        return render(request,'minecrowdfunding.html')

