from django.core.files.storage import default_storage
from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.core.urlresolvers import reverse
from django.http import HttpResponse, JsonResponse
from project.models import ProjectInfo,RepayInfo,AccountNumInfo
import time
from project.forms import UploadImageForm

'''
阅读协议
'''
class StartProView(View):
    def get(self, request):
        context = {
        }
        return render(request, 'startpro/start.html', context=context)


'''
项目信息-------------------------------->>>>>简单form表单
'''
class ProjectInfoView(View):
    def get(self, request):
        context = {
        }
        return render(request, 'startpro/start-step-1.html', context=context)
    
    def post(self, request):
        # 和此页面无关的字段在提交时报错，在创建模型时需要指定默认值，不然插入数据时报错！！！！
        data = dict()
        category_type = request.POST.get('inlineRadioOptions', '')
        projectname = request.POST.get('projectname', '')
        projectdesc = request.POST.get('projectdesc', '')
        target_money = request.POST.get('target_money', '')
        total_time = request.POST.get('total_time', '')
        brief_intro = request.POST.get('brief_intro', '')
        detail_intro = request.POST.get('detail_intro', '')
        mobile = request.POST.get('mobile', '')
        service_phone = request.POST.get('service_phone', '')
        
        # 直接使用request.FILES.get接收文件！！！！！！！！！！！！！！
        main_img = request.FILES.get('main_img')
        detail_img = request.FILES.get('detail_img')
        
        # 关联的外键需要增加当前用户的id！！！！
        proinfo = ProjectInfo.objects.create(
            category=category_type, name=projectname, desc=projectdesc, target_money=int(target_money),
            total_time=int(total_time), brief_intro=brief_intro, detail_intro=detail_intro, mobile=mobile,
            service_phone=service_phone, user_id=request.user.id,main_img=main_img,detail_img=detail_img
        )
        # 把创建的项目保存到seesion中，下一个回报的视图使用！！！
        request.session['project_id'] = proinfo.id
        print('request.session[project_id]', request.session['project_id'])
        print(category_type, projectname, projectdesc, target_money, total_time, brief_intro, detail_intro,
              service_phone)
        # data['res'] = 200
        # return JsonResponse(data)
        return redirect(reverse('startpro:projectrepay'))

# '''
# 项目信息
# '''
# class ProjectInfoView(View):
#     def get(self, request):
#         context = {
#         }
#         return render(request, 'startpro/start-step-1.html', context=context)
#
#     def post(self,request):
#         # 和此页面无关的字段在提交时报错，在创建模型时需要指定默认值，不然插入数据时报错！！！！
#         data = dict()
#         category_type = request.POST.get('category_type','')
#         projectname = request.POST.get('projectname','')
#         projectdesc = request.POST.get('projectdesc','')
#         target_money = request.POST.get('target_money',1)
#         total_time = request.POST.get('total_time','')
#         brief_intro = request.POST.get('brief_intro','')
#         detail_intro = request.POST.get('detail_intro','')
#         mobile = request.POST.get('mobile','')
#         service_phone = request.POST.get('service_phone','')
#
#         # # post方式上传文件失败？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
#         # main_img_name = str(int(time.time())) + request.FILES['main_img'].name
#         # main_img_content = request.FILES['main_img']
#         # with default_storage.open('MEDIA_ROOT'+'main_img/2018/05/'+main_img_name,'wb+') as f:
#         #     for chunk in main_img_content.chunks():
#         #         f.write(chunk)
#         #
#         # main_img = 'main_img/2018/05/'+main_img_name
#         # print('main_imgmain_imgmain_imgmain_img',main_img)
#
#
#         # form 表单方式失败？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
#         # image_form = UploadImageForm(request.POST, request.FILES)
#         # if image_form.is_valid():
#         #     image_form.save()
#
#
#
#
#         # 关联的外键需要增加当前用户的id！！！！
#         proinfo = ProjectInfo.objects.create(
#             category=category_type,name=projectname,desc=projectdesc,target_money=target_money,
#             total_time=total_time,brief_intro=brief_intro,detail_intro=detail_intro,mobile=mobile,
#             service_phone=service_phone,user_id=request.user.id,
#         )
#         # 把创建的项目保存到seesion中，下一个回报的视图使用！！！
#         request.session['project_id'] = proinfo.id
#         print('request.session[project_id]',request.session['project_id'])
#         print(category_type,projectname,projectdesc,target_money,total_time,brief_intro,detail_intro,service_phone)
#         data['res'] = 200
#         # data['project_id'] = proinfo.id
#         return JsonResponse(data)
    
'''
回报信息
'''
class ProjectRepayView(View):
    def get(self, request):
        context = {
        }
        return render(request, 'startpro/start-step-2.html', context=context)
    
    def post(self,request):
        data = dict()
        repay_type = request.POST.get('repay_type', '')
        support_money = request.POST.get('support_money', 0)
        repay_content = request.POST.get('repay_content', '')
        repay_num = request.POST.get('repay_num', 0)
        is_limit_buy = request.POST.get('is_limit_buy', '')
        limit_buy_num = request.POST.get('limit_buy_num', 0)
        freight = request.POST.get('freight', 0)
        receipt = request.POST.get('receipt', '')
        repay_time = request.POST.get('repay_time', 0)
        repay_img = request.FILES.get('repay_img','')
    
        print('request.session[project_id]----------------------',request.session['project_id'])

        # 要添加关联项目的外键
        repayinfo = RepayInfo.objects.create(
            type=repay_type,support_money=support_money,repay_content=repay_content,
            repay_num=repay_num,is_limit_buy=is_limit_buy,limit_buy_num=limit_buy_num,
            freight=freight,receipt=receipt,repay_time=repay_time,repay_img=repay_img,
            project_id=request.session['project_id'],
            # project_id=6,
        )
        return render(request,'startpro/start-step-3.html',)
        # data['res'] = 200
        # # 每添加一条回报信息，应该在页面加入table表的元素，并且可以编辑回报内容未完成？？？？？？？？？？？？？？？？？？？？？？？？、
        # return JsonResponse(data)

'''
收款账号信息
'''
class AccountInfoView(View):
    def get(self, request):
        context = {
        }
        return render(request, 'startpro/start-step-3.html', context=context)

    def post(self, request):
        data = dict()
        company_num = request.POST.get('company_num', '')
        id_card = request.POST.get('id_card', '')
    
        # print('request.session[project_id]----------------------', request.session['project_id'])
    
        # 要添加关联项目的外键
        accountinfo = AccountNumInfo.objects.create(
            company_num=company_num,id_card=id_card,user=request.user,
            project_id=request.session['project_id'],
        )
        data['res'] = 200
        return JsonResponse(data)
    
'''
完成项目发起
'''
class CompleteProView(View):
    def get(self, request):
        
        # 需要将项目的状态设置从即将开始设置为众筹中，项目审核未通过？？？，通过后改状态？？？？？？？？？
        context = {
        }
        return render(request, 'startpro/start-step-4.html', context=context)