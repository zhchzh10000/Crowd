import re
from _sha1 import sha1

from django.contrib.auth.hashers import make_password
from django.shortcuts import render

# Create your views here.
from django.views.generic import View

from users import models
from users.froms import LoginForm
from users.models import User_Table

def get_hash(str):
	sh = sha1()
	sh.update(str.encode('utf-8'))
	return sh.hexdigest()
def index(request):
	if request.session.get('islogin'):
		username = request.session.get('username')

		return render(request,'index.html',{'username':username})
def logout(request):
	request.session.flush()
	return  render(request,'index.html')

def login(request):

	if request.method =='POST':
		username = request.POST.get('username','')
		password = request.POST.get('password', '')
		password = get_hash(password)
		ty = request.POST.get('types', '')
		Permissions = request.POST.get('remember','')
		us = User_Table()
		if ty == 'remember-me':
			us.remember = True
		else:
			us.remember = False

		if not all([username,password]):
			return render(request, 'login.html', {'err': '参数不能为空'})

		user = User_Table.objects.filter(name=username)

		if user:
			request.session['islogin'] = True
			request.session['username'] = username
			return render(request,'index.html')

		else:
			return render(request,'login.html',{'err':'用户不存在'})
	elif request.method =='GET':
		return render(request, 'login.html')




def reg(request):

	if request.method == 'POST':
		username = request.POST.get('name','')
		password = request.POST.get('password','')

		email = request.POST.get('email','')
		types = request.POST.get('type','')
		if types=='企业':
			types = 1
		elif types == '个人':
			types = 0
		if not all([username,password,email]):
			return render(request,'reg.html',{'err':'参数不能为空'})
		if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
			return render(request, 'reg.html', {'err': '邮箱有误'})

		user = User_Table.objects.filter(name=username)

		if user:

			return render(request, 'reg.html',{'err':'用户重复'})

		user = User_Table()
		user.name = username
		user.password = get_hash(password)
		user.email = email
		user.types = types
		user.save()
		return render(request, 'login.html')
	elif request.method == 'GET':
		return render(request, 'reg.html')
def member(request):
	pass