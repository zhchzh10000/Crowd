from django.http import HttpResponse
from permit.forms import FilesForm,PhotoForm
from pure_pagination import Paginator, PageNotAnInteger
from django.shortcuts import render

from django.views.generic.base import View
# Create your views here.

from django.db.models import Q
from permit.models import Project,Type,Follower,Tag,Twolable,Return

import json

"""
商品詳情頁
"""
class Detail(View):
    def get(self, request,project_id):
        return render(request, "project.html")


"""
商品列表頁
"""
class Projects(View):
    def get(self, request):
        # 列表
        all_project = Project.objects.all()
        #项目总数
        all_num = Project.objects.all().count()
        #类型总数
        all_type = Type.objects.all()

        type = request.GET.get('type', '')
        try:
            type = Type.objects.get(name=type)
        except Exception as e:
            pass

        if type:
            all_project = Project.objects.filter(type=type)

        all_support = Follower.objects.all().count()

        #根据状态排序
        sort = request.GET.get('sort', '')
        print(sort)
        if sort:
            all_project = Project.objects.filter(status=sort)
        #时间排序
        date = request.GET.get('date', '')
        if date =='createdate':
            all_project = all_project.order_by('-createdate')
        #金额排序
        money = request.GET.get('money', '')
        if money == 'money':
            all_project = all_project.order_by('-money')
        #支持者排序
        support = request.GET.get('support', '')
        if support == 'support':
            all_project = Follower.objects.all().order_by('-num')

        #老师搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            print('11111111')
            print(all_project)
            all_project = all_project.filter(
                Q(name__icontains=search_keywords) |
                Q(type__icontains=search_keywords) |
                Q(day__icontains=search_keywords)
            )

        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_project, 4,request=request)
        project = p.page(page)

        return  render(request,"projects.html",{
            "all_project": project,
            'all_num':all_num,
            'all_type':all_type,
            'sort':sort,
            'all_support':all_support,
        })


"""
商品支付頁
"""
class Order(View):
    def get(self, request):
        return render(request, "pay-step-1.html")


"""
商品支付頁
"""
class Pay(View):
    def get(self, request):
        return render(request, "pay-step-2.html")


"""
发起众筹
"""
class Start(View):
    def get(self, request):
        return render(request, "start.html")


"""
发起众筹
"""
class Step_a(View):
    def get(self, request):
        type_list = Type.objects.all()
        tag_list = Tag.objects.all()

        return render(request, 'start-step-1.html', {
            'type_list': type_list,
            'tag_list': tag_list,
        })

    def post(self, request):
        form = FilesForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            headimg = form.cleaned_data['project_head_img']
            detail_img = form.cleaned_data['project_detail']
            #选择框
            type = request.POST.get('inlineRadioOptions', '')
            #获取标签
            tags = request.POST.getlist('lable', '')

            print(tags)
            #名字
            name = request.POST.get('name', '')
            #简介
            remark = request.POST.get('remark', '')
            money = request.POST.get('money', '')
            day = request.POST.get('day', '')
            show = request.POST.get('show', '')
            detail_show = request.POST.get('detail_show', '')
            phone = request.POST.get('phone', '')
            service_phone = request.POST.get('service_phone', '')
            project = Project()
            try:
                type = Type.objects.get(name=type)
            except Exception as e:
                pass

            project.type = type
            print(type)
            project.name = name
            project.remark = remark
            project.money = money
            project.day = day
            project.memberid = request.user
            project.project_head_img = headimg
            project.project_detail = detail_img
            project.show = show
            project.detail_show = detail_show
            project.phone = phone
            project.service_phone = service_phone
            project.save()

            # for tag in tags:
            #     tag = Twolable.objects.get(name=tag)
            #     project.tag.add(tag)
            #     print('11111')
            #     print(tag)
            # project.save()
            print('project', project.id)
            return render(request, 'start-step-2.html', {'project_id': project.id})


"""
发起众筹
"""
class Step_b(View):
    def get(self, request):
        retus = Return.objects.all()
        return render(request, "start-step-2.html" ,{'retus':retus})
    def post(self,request):
        form = PhotoForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            img = form.cleaned_data['explain']
            # 回报类型
            type = request.POST.get('inlineRadioOptions', '')
            print(type)
            # 回报内容
            content = request.POST.get('content', '')
            print(content)
            #支持金额
            supportmoney = request.POST.get('supportmoney', '')
            #单笔限购
            purchase = request.POST.get('purchase', '')
            #


        return render(request, "start-step-2.html")



"""
发起众筹
"""
class Step_c(View):
    def get(self, request):
        return render(request, "start-step-3.html")


"""
发起众筹
"""
class Step_d(View):
    def get(self, request):
        return render(request, "start-step-4.html")