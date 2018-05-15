import re

from django.contrib.auth import authenticate,login
from django.core.urlresolvers import reverse
from django.shortcuts import render,redirect
from django.views.generic import View

from db.verification import login_check
from users.models import Member


class LoginView(View):
    def get(self,request):
        return render(request,'users/login.html')

    def post(self,request):
        username = request.POST.get("username", "")
        password = request.POST.get("password", "")
        select = request.POST.get('select','')
        if not all([username,password,select]):
            return render(request, "users/login.html", {"errmsg": "数据不能为空"})
        if select == 'user':
            user = authenticate(username=username,password=password)
        # if get_user_model()._default_manager.get_by_natural_key(username).check_password(password):
        #     user = get_user_model()._default_manager.get_by_natural_key(username)
        # else:
        #     user = None
        # print('ssssssssssss',username,password,get_user_model(),user,hashers.check_password(password,hashers.make_password(password)))
        # print('nnnn',get_user_model()._default_manager.get_by_natural_key(username))
            if user:
                login(request, user)
                return redirect('/admin/')
            else:
                return render(request, "users/login.html", {"errmsg": "用户名或密码错误"})
        elif select == 'member':
            member = Member.objects.get_one_member(password=password,username=username)
            if member:
                request.session['member_id'] = member.id
                request.session['islogin'] = True
                request.session['username'] = member.username
                return redirect(reverse('crowd:index'))
            else:
                return render(request, "users/login.html", {"errmsg": "用户名或密码错误"})


class RegisterView(View):
    def get(self, request):
        return render(request, 'users/reg.html')

    def post(self, request):
        email = request.POST.get('email', '')
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user_type = request.POST.get('select', '')

        if not all([username, password, email,user_type]):
            # 有数据为空
            return render(request, 'users/reg.html', {'errmsg': '参数不能为空!'})

            # 判断邮箱是否合法
        if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            # 邮箱不合法
            return render(request, 'users/reg.html', {'errmsg': '邮箱不合法!'})

        if Member.objects.filter(username=username):
            return render(request, 'users/reg.html', {'errmsg': '用户已经存在！'})

        try:
            Member.objects.add_one_member(password=password,username=username,email=email)
            return render(request, 'users/login.html')
        except Exception as e:
            print('0000',e)
            return render(request, 'users/reg.html', {'errmsg': '服务器错误！'})

@login_check
def member_core(request):
    member_id = request.session['member_id']
    user_status = Member.objects.get(id=member_id)['user_status']
    return render(request,'users/member.html',{'user_status':user_status})


def min_crowd(request):

    return render(request,'users/minecrowdfunding.html')

