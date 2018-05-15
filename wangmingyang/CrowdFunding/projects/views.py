from django.shortcuts import render
from operation.forms import *
from operation.models import Repay
from django.views.generic.base import View
from django.http import HttpResponse
from users.models import *
from .forms import *
import json
from .models import *
from pure_pagination import Paginator,PageNotAnInteger
from django.db.models import Q
# Create your views here.

class ProjectListView(View):
    def get(self,request):
        type_list = ProjectType.objects.all()
        project_list = Project.objects.all()
        num = project_list.count()
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            project_list = project_list.filter(
                Q(name__icontains=search_keywords) |
                Q(remark__icontains=search_keywords) |
                Q(status__icontains=search_keywords)
            )
        #排序
        type = request.GET.get('type','')
        if type:
            project_list = project_list.filter(type=int(type))
        status = request.GET.get('status', '')
        if status:
            project_list = project_list.filter(status=int(status))
        sort = request.GET.get('sort', '')
        if sort == 'deploy_date':
            project_list = project_list.order_by('-deploy_date')
        elif sort == 'target_money':
            project_list = project_list.order_by('-target_money')
        elif sort == 'supporters':
            project_list = project_list.order_by('-supporters')

        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(project_list,1, request=request)
        project_list = p.page(page)

        return render(request,'projects.html',{
            'type_list':type_list,
            'project_list':project_list,
            'num':num,
            'type':type,
            'status':status,
            'sort':sort,
        })


class StartView(View):
    def get(self,request):
        return render(request,'start.html')


'''发起众筹'''
class Step1View(View):
    def get(self,request):
        tag1_list = TagFirst.objects.all()
        tag2_list = TagSecond.objects.all()
        return render(request,'start-step-1.html',{'tag1_list':tag1_list,'tag2_list':tag2_list})
    # 用户修改头像
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES)
        if image_form.is_valid():
            name = request.POST.get('project_name', '')
            in_short = request.POST.get('in_short','')
            support_money = request.POST.get('support_money', '')
            period = request.POST.get('period', '')
            project_title = request.FILES.get('project_title', '')
            project_desc = request.FILES.get('project_desc', '')
            introduce = request.POST.get('introduce', '')
            introduce_desc = request.POST.get('introduce_desc', '')
            mobile = request.POST.get('mobile', '')
            customer_phone = request.POST.get('customer_phone', '')
            # tag1 = request.POST.getlist('tag1','')

            project = Project()
            project.introduce = introduce
            project.introduce_desc = introduce_desc
            project.mobile = mobile
            project.customer_phone = customer_phone

            project.type= ProjectType.objects.get(pk='1')
            project.tag1 = TagFirst.objects.get(pk='1')
            project.tag2=TagSecond.objects.get(pk='1')
            project.project_name = name
            project.in_short = in_short
            project.support_money = support_money
            project.period = period
            project.project_title = project_title
            project.project_desc = project_desc
            project.save()
            return render(request,'start-step-1.html')


class Step2View(View):
    def get(self,request):
        return render(request,'start-step-2.html')

    def post(self,request):
        image_form = ImageForm(request.POST, request.FILES)
        if image_form.is_valid():
            type = request.POST.get('inlineRadioOptions','')
            money = request.POST.get('money','')
            count = request.POST.get('count','')
            context = request.POST.get('context','')
            desc = request.POST.get('desc', '')
            freight = request.POST.get('freight','')
            residue = request.POST.get('residue','')
            pay = Repay()
            pay.type = type
            pay.count = count
            pay.supportmoney = money
            pay.content = context
            pay.image = desc
            pay.freight = freight
            pay.residue = residue
            pay.save()
            return render(request,'start-step-2.html')


class Step3View(View):
    def get(self,request):
        return render(request,'start-step-3.html')

    def post(self, request):
        email = request.POST.get('email','')
        cardnum = request.POST.get('cardnum', '')
        user = Member()
        user.cardnum = cardnum
        user.save()
        return render(request, 'start-step-3.html')


class Step4View(View):
    def get(self,request):
        return render(request,'start-step-4.html')


class ProjectDetailView(View):
    def get(self,request,project_id):
        project = Project.objects.get(id=int(project_id))
        return render(request, 'project.html', {
            'project':project,

        })











