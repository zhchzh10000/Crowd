from django.http import HttpResponseRedirect
from django.shortcuts import render
# 导入系统的方法 验证 登陆
from django.contrib.auth import authenticate, login, logout

from .models import UserProfile
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from .models import UserProfile, EmailVerifyRecord

from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm
from django.views.generic.base import View

from django.contrib.auth.hashers import make_password
from utils.email_send import send_register_email


from django.http import HttpResponse, HttpResponsePermanentRedirect
from .forms import UserInfoForm, UploadImageForm

import json
from django.core.urlresolvers import reverse


# Create your views here.


def index(request):
	return render(request,'index.html')


# 用户登陆通过用户名或者邮箱
class CustomBackend(ModelBackend):
	def authenticate(self, username=None, password=None, **kwargs):
		try:
			user = UserProfile.objects.get(Q(username=username) | Q(email=username))
			if user.check_password(password):
				return user
		except Exception as e:
			return None


class UserLogin(View):
	def get(self, request):
		return render(request, 'login.html')

	def post(self, request):
		login_form = LoginForm(request.POST)
		if login_form.is_valid():  # 验证成功
			username = request.POST.get('username', '')
			password = request.POST.get('password', '')
			role = request.POST.get('role', '')
			user = authenticate(username=username, password=password, role=role)
			if user is not None:
				login(request, user)
				if role == 'admin' and user.is_staff:

					return HttpResponseRedirect('/admin/')
				elif role == 'member':
					return render(request,'index.html',{'user':user})
				else:
					return render(request,'login.html')
			else:
				return render(request, 'login.html', {'msg': '用户没有激活,请进入邮箱激活'})
		else:
			return render(request, 'login.html', {'login_form': login_form})


class RegisterView(View):
	def get(self, request):
		# get 请求的时候，把验证码组件一系列的 HTML render 到 register.html 里
		register_form = RegisterForm(request.POST)
		return render(request, 'reg.html', {'register_form': register_form})

	def post(self, request):
		register_form = RegisterForm(request.POST)
		if register_form.is_valid():
			username = request.POST.get('username', '')
			email = request.POST.get('email', '')
			password = request.POST.get('password', '')
			customer_type = request.POST.get('type','')
			if UserProfile.objects.filter(email=email):
				return render(request, 'reg.html', {'register_form': register_form, 'msg': '用户已经存在！'})

			user_profile = UserProfile()
			user_profile.username = username
			user_profile.email = email
			user_profile.password = make_password(password)
			user_profile.customer_type = customer_type

			user_profile.save()
			send_register_email(email)
			return render(request, 'index.html')

		return render(request, 'reg.html', {'register_form': register_form})


class LogoutView(View):
	def get(self, request):
		logout(request)
		return HttpResponsePermanentRedirect(reverse('index'))


#发起众筹
class InitiateView(View):
	def get(self, request):
		return render(request, 'start.html')

#发起众筹2
class InitiateView2(View):

