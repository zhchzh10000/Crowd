from django.core.urlresolvers import reverse
from django.http import JsonResponse, request
from django.shortcuts import render, redirect
from django.shortcuts import render,render_to_response
from django.http import HttpResponse
from django import forms
from itsdangerous import Serializer
from pip._vendor.html5lib import serializer
from crown_funding import settings
# from store.models import Banner_list
# from store.models import Prodetail
from users.models import Passport, EmailCode, UserProfile,Banner




# 注册
def register(request):
	if request.method == 'POST':
		username = request.POST.get('user_name')
		password = request.POST.get('pwd')
		email = request.POST.get('email')

		user = Passport()
		user.username = username
		user.password = password
		user.email = email
		user.save()

		return render(request,'login.html')
	else:
		return render(request, 'reg.html')


def login_check(request):
	username = request.POST.get('username')
	password = request.POST.get('password')
	remember = request.POST.get('remember')

	if not all([username,password,remember]):
		return JsonResponse({'res':2})

	passport = Passport.objects.get_one_passport(username=username,password=password)
	if passport:
		next_url = reverse('users:index')
		jres = JsonResponse({'res':1,'next_url':next_url})

		if remember == 'true':
			jres.set_cookie('username',username,max_age=7*24*3600)
		else:
			jres.delete_cookie('username')

		request.session['islogin'] = True
		request.session['username'] = username
		request.session['passport_id'] = passport.id
		return jres
	else:
		return JsonResponse({'res':0})

def login(request):
	username = ''
	checked = ''
	context = {
		'username': username,
		'checked': checked,
	}
	return render(request, 'index.html', context)

#邮件注册激活
def active(request):
	records = EmailCode.objects.filter(code=active)
	if records:
		for record in records:
			email = record.email
			users = UserProfile.objects.filter(email=email)
			users.is_active = 1
			users.save()
		return redirect(reverse('users:login'))
	return render(request,'users/active_fail.html')

def logout(request):
	'''用户退出登录'''
	#清空session信息
	request.session.flush()
	return redirect(reverse('users:index'))




# def member(request):
# 	return render(request,'member.html')
#
#













