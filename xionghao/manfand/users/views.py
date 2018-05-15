from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.views.generic import View
from .addhash import get_hash
from order.models import OrderInfo
from django.http import JsonResponse,HttpResponse
from .forms import LoginForm,RegisterForm
from product.models import ProFollow
from .models import UserMsg,EmailVerifyRecord
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.utils.decorators import method_decorator
from users.send_email import send_register_email
# Create your views here.
class CustomBackend(ModelBackend):

    def authenticate(self, name=None, password=None, **kwargs):
        try:
            user = UserMsg.objects.get(Q(name=name)|Q(email=name))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class Login(View):
    def get(self,request):
        return render(request,'html/login.html')
    def post(self,request):
        login_forms = LoginForm(request.POST)
        if login_forms.is_valid():
            name = request.POST.get('name')
            password = request.POST.get('password')
            pop = request.POST.get('pop')
            rem = request.POST.get('rem')
            jres = JsonResponse({})
            if rem == True:
                jres.set_cookie('password', password, max_age=7 * 24 * 3600)
            user = CustomBackend().authenticate(name=name, password=password)
            if user:
                request.session['islogin'] = True
                request.session['name'] = name
                request.session['user_id'] = user.id
                # return render(request, "html/index.html")
                return redirect(reverse('product:index'))
        return render(request,'html/login.html',{"msg":"信息为空或者格式不正确"})

class LoginOut(View):
    def get(self,request):
        request.session.flush()
        return redirect(reverse('product:index'))

class Register(View):
    def get(self,request):
        return render(request,'html/reg.html')
    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            email = request.POST.get('email')
            name = request.POST.get('name')
            if UserMsg.objects.filter(name=name):
                return render(request,'html/reg.html',{"msg":"用户已经存在"})
            if UserMsg.objects.filter(email=email):
                return render(request,'html/reg.html',{"msg":"邮箱已经存在"})
            password = request.POST.get('password')
            pop =  request.POST.get('pop')
            send_register_email(email, send_type="register")
            if pop =='企业':
                pop = 1
            else:
                pop = 0
            user = UserMsg()
            user.email = email
            user.name = name
            user.password = get_hash(password)
            user.option = pop
            user.save()
            return render(request, "html/login.html")
        return render(request,'html/reg.html',{"msg":"参数不能为空"})

class active_code(View):
    def get(self,request,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for records in all_records:
                email = records.email
                user = UserMsg.objects.get(email=email)
                if user:
                    user.is_active = True
                    user.save()
                    return render(request, 'html/login.html')

class MemberView(View):
    def get(self,request):
        try:
            user_id = request.session._session['user_id']
        except:
            return render(request,'html/login.html')
        orderinfo = OrderInfo.objects.filter(user_id=user_id)
        profollow = ProFollow.objects.filter(user_id=user_id)

        if orderinfo:
            return render(request,'html/minecrowdfunding.html',{
                'orderinfo':orderinfo,
                'profollow':profollow
            })

class Member(View):
    def get(self,request):
        return render(request,'html/member.html')