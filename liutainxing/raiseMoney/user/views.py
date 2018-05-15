from django.shortcuts import render, redirect
from django.views.generic import View
from user.forms import LoginForm, RegisterForm
from user.models import UserProfile, EmailVerifyRecord
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.core.urlresolvers import reverse
from .models import Banner
from projects.models import TProject
from utils.email_send import send_register_email

# Create your views here.


# 首页
class IndexView(View):
	def get(self, request):
		all_banner = Banner.objects.all()
		hot_project = TProject.objects.all().order_by('-supporter')[:3]
		kj_project = TProject.objects.filter(is_category='kj')[:4]
		sj_project = TProject.objects.filter(is_category='sj')[:4]
		ny_project = TProject.objects.filter(is_category='ny')[:4]
		qt_project = TProject.objects.filter(is_category='qt')[:4]

		return render(request, 'index.html', {
			'all_banner': all_banner,
			'hot_project': hot_project,
			'kj_project': kj_project,
			'sj_project': sj_project,
			'ny_project': ny_project,
			'qt_project': qt_project,

		})


#



# # 用户登录
class UserLoginView(View):
	def get(self, request):
		return render(request, 'login.html')

	def post(self, request):
		login_form = LoginForm(request.POST)

		if login_form.is_valid():
			username = request.POST.get('username')
			password = request.POST.get('password')
			# remember = request.POST.get('remember')
			types = request.POST.get('types')
			if types == 'member':
				is_staff = 0
			else:
				is_staff = 1
			# print(remember)
			user = authenticate(username=username, password=password)

			# 	login(request, user)  # 调用login方法登陆账号
			# 	return render(request, "index.html")
			# else:
			# 	return render(request, "login.html", {"msg": u"用户未激活"})

			if user.is_active:
			# if user.is_active:
				login(request, user)
				request.session['passport_id'] = user.id
				if user.is_staff == 1:
					return render(request, 'main.html', {'res': 0})


				else:
					return render(request, 'index.html', {'res': 1})
			return render(request, 'login.html', {'error': '用户未激活'})

		return render(request, 'login.html', {'login_form': login_form})  # 用户注册
class UserRegisterView(View):
	def get(self, request):
		return render(request, 'reg.html')

	def post(self, request):
		register_form = RegisterForm(request.POST)
		if register_form.is_valid():
			username = request.POST.get('username')
			if UserProfile.objects.filter(username=username):
				return render(request, 'reg.html', {'msg': '用户名已存在', 'register_form': register_form})
			password = request.POST.get('password')
			email = request.POST.get('email')
			types = request.POST.get('type')
			print(types)
			user = UserProfile()
			user.username = username
			user.password = make_password(password=password)
			user.email = email
			user.usertype = types
			user.is_active = False
			user.save()
			send_register_email(email,send_type="register")
			return render(request, 'login.html')
		return render(request, 'reg.html', {'register_form': register_form})


class MemberView(View):
	def get(self, request):
		return render(request, 'member.html')


class MessageView(View):
	def get(self, request):
		return render(request, 'message.html')


class LogoutView(View):
	def get(self, request):
		logout(request)
		# return reverse(redirect('index'))
		return redirect(reverse('index'))


class ActiveUserView(View):
	def get(self, request, active_code):
		# 用code在数据库中过滤处信息
		all_records = EmailVerifyRecord.objects.filter(code=active_code)
		if all_records:
			for record in all_records:
				email = record.email
				# 通过邮箱查找到对应的用户
				user = UserProfile.objects.get(email=email)
				# 激活用户
				user.is_active = True
				user.save()
		else:
			return render(request, "active_fail.html")
		return render(request, "login.html")
