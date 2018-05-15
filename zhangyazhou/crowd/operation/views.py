import re

from django.core.mail import send_mail
from django.shortcuts import render
from django.http import JsonResponse
from django.views.generic import View
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired

from crowd import settings
from users.models import RealName
from db.verification import login_check
from utils.random_str import random_str
from operation.models import VerificationCode


def start_crowd(request):

    return render(request, 'operation/start.html')


def accttype(request):
    return render(request,'operation/accttype.html')


@login_check
def apply(request):
    member_id = request.session['member_id']
    try:
        tag_id = request.GET['tag_id']
    except Exception:
        tag_id =None
    if tag_id:
        real_name = RealName()
        real_name['user_type']=tag_id
        real_name['member']=member_id
        real_name.save()
        return render(request,'operation/apply.html')
    else:
        real_name = RealName.objects.filter(member_id=member_id)
        tag_id=real_name['user_type']
        if tag_id:
            return render(request, 'operation/apply.html')
        else:
            return render(request, 'operation/accttype.html')


class Apply1View(View):
    @login_check
    def get(self,request):
        member_id = request.session['member_id']
        try:
            real_name = RealName.objects.get(member_id=member_id)
            return render(request, 'operation/apply-1.html')
        except Exception:
            return render(request, 'operation/accttype.html')

    @login_check
    def post(self,request):
        member_id = request.session['member_id']
        name = request.POST.get('name')
        cadenum = request.POST.get('cadenum')
        phone = request.POST.get('phone')
        if not  all([name,cadenum,phone]):
            return JsonResponse({'res':400,'errmsg':'数据不完整'})
        try:
            real_name = RealName.objects.get(member_id=member_id)
        except Exception:
            real_name = None
        if real_name:
            real_name['realname']=name
            real_name['cardnum']=cadenum
            real_name['phone']=phone
            real_name.save()
            return JsonResponse({'res':200})
        else:
            return render(request,'operation/accttype.html')


class Apply2View(View):
    @login_check
    def get(self, request):
        member_id = request.session['member_id']
        try:
            real_name = RealName.objects.get(member_id=member_id)
            return render(request, 'operation/apply-2.html')
        except Exception:
            return JsonResponse({'res': 304, 'errmsg': '请先选择认证类型'})

    @login_check
    def post(self, request):
        member_id = request.session['member_id']
        file_obj = request.FILES.get('file')
        if not all(file_obj):
            return JsonResponse({'res': 400, 'errmsg': '数据不完整'})
        try:
            real_name = RealName.objects.get(member_id=member_id)
        except Exception:
            real_name = None
        if real_name:
            real_name['hand_image'] = file_obj
            real_name.save()
            return JsonResponse({'res': 200})
        else:
            return JsonResponse({'res': 304, 'errmsg': '请先选择认证类型'})


class Apply3View(View):
    @login_check
    def get(self, request,email):
        member_id = request.session['member_id']
        try:
            real_name = RealName.objects.get(member_id=member_id)
            return render(request, 'operation/apply-3.html',{'email':email})
        except Exception:
            return JsonResponse({'res': 304, 'errmsg': '请先选择认证类型'})


    @login_check
    def post(self, request,email):
        member_id = request.session['member_id']
        if not all(email):
            return JsonResponse({'res': 400, 'errmsg': '数据不完整'})

        if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            # 邮箱不合法
            return render(request, 'users/reg.html', {'errmsg': '邮箱不合法!'})
        try:
            real_name = RealName.objects.get(member_id=member_id)
        except Exception:
            real_name = None
        if real_name:
            slice = random_str(6)
            member_code = VerificationCode()
            member_code['member_id']=member_id
            member_code['code_type']='smrz'
            member_code['code']=slice
            member_code.save()
            send_mail('尚筹网实名认证','',settings.EMAIL_FROM,[email],slice)
            return JsonResponse({'res': 200,'email':email})
        else:
            return JsonResponse({'res': 304, 'errmsg': '请先选择认证类型'})