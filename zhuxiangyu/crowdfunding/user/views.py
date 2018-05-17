from django.shortcuts import render,redirect
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .models import UserProfile,UserCertify,UserAddress
from django.core.urlresolvers import reverse
from django.http import HttpResponse, JsonResponse, HttpResponsePermanentRedirect
from project.models import ProjectInfo,UserFavProject
from util.email_send import sendemail
from order.models import OrderInfo,RepayInfo
from django.contrib.auth import logout,login,authenticate
from datetime import datetime

'''
首页
'''
class IndexView(View):
    def get(self,request):
        
        # 访问的客户端的IP地址
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            # 使用nginx时获取的地址
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']
        print('访问的客户端的IP地址',ip)
        with open('./loginfo.txt','a+') as f:
            f.write('访问的客户端的IP地址{},时间{}\n'.format(ip,datetime.now()))
            
        projects = ProjectInfo.objects.all()
        all_project = projects.order_by('-fav_num')[:3]
        
        category = request.POST.get('category')
        tech_project = projects.filter(category='technology').order_by('-fav_num')[:4]
        
        context = {
            'all_project':all_project,
            'tech_project':tech_project,
        }
        return render(request,'index.html',context=context)
    
'''
用户登录
'''
class LoginView(View):
    def get(self, request):
        return render(request, "user/login.html", {})

    def post(self, request):
        data = dict()
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password)
        user = authenticate(username=username, password=password)
        login(request, user)
        data['res'] = 200
        return JsonResponse(data)
        # login_form = LoginForm(request.POST)
        # if login_form.is_valid():  # 验证成功
        #     username = request.POST.get("username", "")
        #     password = request.POST.get("password", "")
        #     user = authenticate(username=username, password=password)
        #     if user is not None:
        #        if user.is_active:
        #             login(request, user)
        #             return render(request, "index.html")
        #        else:
        #            return render(request,'login.html',{"msg":"用户没有激活，请进入邮箱激活"})
        #     else:
        #         return render(request, "login.html", {"msg": u"用户名或密码错误"})
        # else:
        #     return render(request, "login.html", {"login_form": login_form})

# 根本没有
# class LoginView(View):
#     def get(self,request):
#         return render(request,'user/login.html',{})
#
#     #post ajax的数据没有传过来，使用的是form表单？？？？？？？？？？？
#     def post(self,request):
#         print('run post')
#         data = dict()
#         username = request.POST.get('username')
#         password = request.POST.get('password')
#         print(username,password)
#         data['res'] = 200
#         return JsonResponse(data)
#         # return redirect(reverse('index'))
    
'''
用户注册
'''
class RegisterView(View):
    def get(self,request):
        return render(request,'user/reg.html',{})
    
    def post(self,request):
        data = dict()
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        usercategory = request.POST.get('usercategory')
        user = UserProfile.objects.create(username=username,password=make_password(password),email=email,usercategory=usercategory)
        data['res'] = 200
        return JsonResponse(data)

'''
用户退出
'''
class LogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponsePermanentRedirect(reverse('index'))

'''
用户中心
'''
class UserInfoView(View):
    def get(self,request):
        return render(request,'user/member.html',{})

'''
用户的众筹项目页面
'''
class UserFundingView(View):
    def get(self,request):
        orderinfo = OrderInfo.objects.filter(user=request.user)
        
        for order in orderinfo:
            repayinfo = RepayInfo.objects.get(id=order.repayinfo_id)
            project = repayinfo.project
            order.pro = project
            
        # 用户发起的所有项目
        project = ProjectInfo.objects.filter(user=request.user)
        
        #用户关注的所有项目
        fav_project = UserFavProject.objects.filter(user=request.user)
        fav_project = [pro.project for pro in fav_project]
        context = {
            'orderinfo':orderinfo,
            'project':project,
            'fav_project':fav_project,
        }
        return render(request,'user/minecrowdfunding.html',context=context)
    
'''
用户认证申请
'''
class UserCertifyApplyView(View):
    def get(self,request):
        return render(request, 'user/accttype.html')
        #
        # data = dict()
        # try:
        #     usercertify = UserCertify.objects.get(user=request.user)
        # except Exception as e:
        #     return render(request,'user/accttype.html')
        # else:
        #     if usercertify.realname_certify == '0':
        #         context = {
        #             'msg':'认证审核中，请稍后！'
        #         }
        #         data['msg'] = '认证审核中，请稍后！'
        #         data['res'] = 0
        #         return JsonResponse(data)
        #         # return render(request, 'user/member.html',context=context)
        #     elif usercertify.realname_certify == '1':
        #         context = {
        #             'msg': '已认证通过！'
        #         }
        #         data['msg'] = '已认证通过！'
        #         data['res'] = 1
        #         return JsonResponse(data)
        #         # return render(request, 'user/member.html', context=context)
        
    def post(self,request):
        # 前端传过来的信息无法获取，此处为js的固定值————————————————————？？？？？？？？？？？、
        data = dict()
        usercertify_type = request.POST.get('certify_type','')
        usercetify = UserCertify.objects.create(usercertify_type=usercertify_type,user=request.user)
        data['res'] = 200
        return JsonResponse(data)

'''
用户认证基本信息
'''
class UserCertifyBaseInfoView(View):
    def get(self,request):
        return render(request,'user/apply.html')
    def post(self,request):
        data = dict()
        realname = request.POST.get('realname')
        id_card = request.POST.get('id_card')
        mobile = request.POST.get('mobile')
        usercetify = UserCertify.objects.get(user=request.user)
        usercetify.realname = realname
        usercetify.id_card = id_card
        usercetify.mobile = mobile
        usercetify.save()
        data['res'] = 200
        return JsonResponse(data)

'''
用户认证上传图片
'''
class UserCertifyLoadImgView(View):
    def get(self,request):
        return render(request,'user/apply-1.html')
    def post(self,request):
        data = dict()
        # 简单实现文件上传的保存
        idcard_handler_img = request.FILES.get("idcard_handler_img")
        usercetify = UserCertify.objects.get(user=request.user)
        usercetify.idcard_handler_img = idcard_handler_img
        usercetify.save()
        #保存图片在静态文件的目录下
        #将文件路径保存到数据库中————————————未实现？？？？？？？？？？？？
        print('假装文件已保存')
        # data['res'] = 200
        # return JsonResponse(data)
        return redirect(reverse('user:usercertify_email'))
    
'''
用户认证邮箱信息
'''
class UserCertifyEmailView(View):
    def get(self,request):
        return render(request,'user/apply-2.html')
    def post(self,request):
        data = dict()
        email = request.POST.get('email','')
        usercetify = UserCertify.objects.get(user=request.user)
        usercetify.email = email
        usercetify.save()
        result = sendemail(email=email,send_type='realname_certify')#同步发送邮件
        if result:
            data['res'] = 200
            data['msg'] = '邮件发送成功'
            return JsonResponse(data)
    
'''
用户认证确认邮箱
'''
class UserCertifyVerifyView(View):
    def get(self,request):
        return render(request,'user/apply-3.html')
    def post(self,request):
        data = dict()
        verifycode = request.POST.get('verifycode','')
        try:
            usercetify = UserCertify.objects.get(verifycode=verifycode)
        except Exception as e:
            print(e)
            data['res'] = 0
            data['msg'] = '验证码错误'
            return JsonResponse(data)
        else:
            data['res'] = 200
            return JsonResponse(data)
        # 审核通过后将实名状态设置为1
        
'''
用户添加送货地址
'''
class AddAddressView(View):
    def post(self,request):
        data = dict()
        receiver = request.POST.get('receiver','')
        phone = request.POST.get('phone','')
        address = request.POST.get('address','')
        add = UserAddress.objects.create(receiver=receiver,phone=phone,address=address,user=request.user)
        print('-------------------',address)
        data['res'] = 200
        return JsonResponse(data)