from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
# 导入系统的方法 验证 登陆
from django.contrib.auth import authenticate, login, logout

from .models import UserProfile, Banner
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from .models import UserProfile, EmailVerifyRecord

from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm
from django.views.generic.base import View

from django.contrib.auth.hashers import make_password
from utils.email_send import send_register_email

from utils.mixin_utils import LoginRequiredMixin

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from django.http import HttpResponse, HttpResponsePermanentRedirect
from .forms import UserInfoForm, UploadImageForm

import json
from django.core.urlresolvers import reverse
from .models import Cert


# Create your views here.


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
					return redirect(reverse('index'))
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
			return redirect(reverse('index'))

		return render(request, 'reg.html', {'register_form': register_form})


class LogoutView(View):
	def get(self, request):
		logout(request)
		return HttpResponsePermanentRedirect(reverse('index'))


class UserCenter(View):
	def get(self,request):
		return render(request,'member.html')

class Mine(View):
	def get(self,request):
		return render(request,'minecrowdfunding.html')



class Accttype(View):
	def get(self,request):
		return render(request,'accttype.html')
	def post(self,request):
		cert_type = request.POST.get('cert_type','')
		cert = Cert()
		cert.cert_type = cert_type
		cert.save()
		return render(request,'apply.html')

class Apply(View):
	def get(self,request):
		return render(request,'apply.html')
	def post(self,request):
		mobile = request.POST.get('mobile','')
		rel_name = request.POST.get('rel_name','')
		rel_number = request.POST.get('rel_number','')
		user = UserProfile()
		user.mobile = mobile
		user.rel_name = rel_name
		user.rel_number = rel_number
		user.save()
		return render(request,'apply-1.html')
class Apply1(View):
	def get(self,request):
		return render(request,'apply-1.html')
	def post(self,request):
		rel_image = request.POST.get('rel_image','')
		user = UserProfile()
		user.rel_image = rel_image
		user.save()
		return render(request,'apply-2.html')

class Apply2(View):
	def get(self,request):
		return render(request,'apply-2.html')
	def post(self,request):
		email = request.POST.get('email','')
		user_email = EmailVerifyRecord()
		user_email.email = email
		user_email.save()
		return render(request,'apply-3.html')
class Apply3(View):
	def get(self,request):
		return render(request,'apply-3.html')
	def post(self,request):
		return redirect(reverse('usercenter'))






