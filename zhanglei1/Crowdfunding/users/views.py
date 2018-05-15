from django.shortcuts import render,render_to_response
from django.views.generic import View
from .forms import RegisterForm,LoginForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse
from django.contrib.auth import authenticate,login,logout
from django.http import HttpResponse,HttpResponseRedirect
import time

from .models import UserProfile,Banner,Type
from project.models import Project,ProjectName


class IndexView(View):
    def get(self,request):
        banners = Banner.objects.all()
        types = Type.objects.all()
        #获取前3个标签
        pyname = ProjectName.objects.all()[:3]
        #获取所有商品
        projects = Project.objects.all()
        #把遍历的每一项添加到project列表里
        project = [pro for pro in projects]
        #定义一个空的列表存放之前的3个标签中所有的商品
        pyname1 = []
        #遍历所哟逇标签，取出每一个标签中每一个项目
        for i in pyname:
            #把每一个项目添加到Pyname1列表汇总
            for j in i.project_set.all():
                pyname1.append(j)
        #从所有的项目中删除前3个标签的商品
        for z in pyname1:
            project.remove(z)

        return render(request,'index.html',{
            'banners':banners,
            'types':types,
            'pyname':pyname,
            'project_list':project
        })


class RegisterView(View):
    def get(self,request):
        return render(request,'register.html',{
        })

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            email = request.POST.get('email', '')
            if UserProfile.objects.filter(email=email):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '用户已经存在！'})
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')


            user_profile = UserProfile()
            user_profile.username = username
            user_profile.password = make_password(password)
            user_profile.email = email
            # user_profile.is_active = False
            user_profile.save()
            # print('注册成功请登录')
            time.sleep(2)

            return render(request, 'login.html')

        return render(request, 'register.html', {'register_form': register_form})


class LoginView(View):
    def get(self,request):
        return render(request,'login.html',{
        })

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get("username", "")
            # 获取密码
            password = request.POST.get("password", "")
            type = request.POST.get('type','')
            # 验证
            user = authenticate(username=username, password=password,type=type)
            print(user)
            if user is not None:
                login(request,user)
                if type == 'user':
                    if user.is_staff:
                        return render(request,'main.html')
                    else:
                        return render(request,'login.html',{"msg": "用户权限不够"})
                elif type == 'member':
                    from django.urls import reverse
                    # return render(request,'index.html')
                    return HttpResponseRedirect(reverse('index'))
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_form": login_form})


#退出登录
class LogoutView(View):
    def get(self,request):
        logout(request)
        # return render(request,'index.html')
        from django.urls import reverse
        #反向解析 用户登出
        return HttpResponseRedirect(reverse('index'))


