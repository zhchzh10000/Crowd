from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from django.views.generic.base import View
from .forms import RegisterForm,LoginForm,IDImageForm
from .models import MemberProfile,EmailVerifyRecord,AccountType,RealNameInfo,IDPicture
from .email_send import send_email
from django.http import HttpResponse
import json
import re
from utils.decorators import login_required


class RegView(View):
    def get(self,request):
        return render(request,'reg.html')

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = request.POST.get('username','')
            if MemberProfile.objects.filter(username=username):
                return render(request,'reg.html',{'register_form':register_form,'msg':'用户已经存在'})
            email = request.POST.get('email','')
            password = request.POST.get('password','')
            user_type = request.POST.get('user_type','')
            MemberProfile.objects.add_one_member(username=username,password=password,email=email,user_type=int(user_type))
            return render(request,'login.html')
        else:
            return render(request,'reg.html',{'register_form':register_form})


class LoginView(View):
    def get(self,request):
        return render(request,'login.html')

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username','')
            password = request.POST.get('password','')
            user = MemberProfile.objects.get_one_member(username,password)
            if user:
                request.session['islogin'] = True
                request.session['user_id'] = user.id
                request.session['username'] = username
                return redirect(reverse('project:index'))
            else:
                return render(request,'login.html',{'msg':'用户名或密码错误'})
        else:
            return render(request,'login.html',{'login_form':login_form})


class LogoutView(View):
    def get(self,request):
        request.session.flush()
        return redirect(reverse('project:index'))

class MemberCenterView(View):
    def get(self,request):
        return render(request,'member.html')


class MyCrowdFundingView(View):
    def get(self,request):
        return render(request,'minecrowdfunding.html')


# 发起实名认证
# 账户类型
class AccountTypeView(View):
    def get(self,request):
        return render(request,'accttype.html')

    def post(self,request):
        member = MemberProfile.objects.get(id=request.session['user_id'])
        type_id = request.POST.get('type_id')
        res = dict()
        account_type_object = AccountType.objects.get(member=member)
        if type_id:
            if not account_type_object:
                account_type = AccountType()
                account_type.type = int(type_id)
                account_type.member = member
                account_type.save()
            else:
                account_type_object.type = type_id
                account_type_object.save()
            res['status'] = 'success'
        else:
            res['status'] = 'fail'
            res['msg'] = '请选择账户类型'
        return HttpResponse(json.dumps(res),content_type='application/json')


# 账户基本信息
class AccountInfoView(View):
    def get(self,request):
        return render(request,'apply.html')

    def post(self,request):
        res = dict()
        name = request.POST.get('real_name')
        card = request.POST.get('id_card')
        phone = request.POST.get('phone_num')

        if not all([name,card,phone]):
            res['status'] = 'fail'
            res['msg'] = '数据不能为空'
            return HttpResponse(json.dumps(res),content_type='application/json')

        if not re.match(r'(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)',card) or not re.match(r'^\d{11,13}$',phone):
            res['status'] = 'fail'
            res['msg'] = '身份证格式或电话号码格式有误'
            return HttpResponse(json.dumps(res), content_type='application/json')

        # 判断该用户实名信息是否存在
        member = MemberProfile.objects.get(id=request.session['user_id'])
        real_info_object = RealNameInfo.objects.get(member=member)
        if real_info_object:
            real_info_object.real_name = name
            real_info_object.id_card = card
            real_info_object.phone_num = phone
            real_info_object.save()
        else:
            real_info = RealNameInfo()
            real_info.real_name = name
            real_info.id_card = card
            real_info.phone_num = phone
            real_info.member = member
            real_info.save()
        res['status'] = 'success'
        res['msg'] = '身份信息存储成功'
        return HttpResponse(json.dumps(res), content_type='application/json')


# from django.core.files.base import ContentFile

# 身份证照片认证
class AccountIDView(View):
    def get(self,request):
        return render(request,'apply-1.html')

    def post(self,request):
        form = IDImageForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            img = request.FILES['pic']
            member = MemberProfile.objects.get(id=request.session['user_id'])
            print(member)
            try:
                id_pic = IDPicture.objects.get(member=member)
            except IDPicture.DoesNotExist:
                pass
            else:
                id_pic.pic = img
                id_pic.save()
                return render(request,'apply-2.html')
            id_pic_new = IDPicture()
            id_pic_new.member = member
            id_pic_new.pic = img
            id_pic_new.save()
            return render(request,'apply-2.html')
        else:
            return render(request,'apply-1.html',{'form':form,'msg':'上传图片有错误，请重新上传'})


# 发送邮箱
class AccountEmailView(View):
    def get(self,request):
        return render(request,'apply-2.html')

    def post(self,request):
        email = request.POST.get('email','')
        res = dict()
        if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            res['status'] = 'fail'
            res['msg'] = '邮件格式错误，请重新填写'
        else:
            send_email(email, 'authenticate')
            res['status'] = 'success'
            res['msg'] = '邮件发送成功，请查收'
            request.session['email'] = email
        return HttpResponse(json.dumps(res), content_type='application/json')


# 验证邮箱验证码
class AccountVCView(View):
    def get(self,request):
        return render(request,'apply-3.html')

    def post(self,request):
        email = request.session['email']
        ev_records = EmailVerifyRecord.objects.filter(email=email)
        res = dict()
        if ev_records:
            for record in ev_records:
                if record.code == request.POST.get('verify_code'):
                    res['status'] = 'success'
                    res['msg'] = '申请成功，请等待审核结果'
                    break
                else:
                    res['status'] = 'fail'
                    res['msg'] = '验证码错误，请重新输入'

        return HttpResponse(json.dumps(res), content_type='application/json')