from django.core.urlresolvers import reverse
from django.shortcuts import render, redirect
from django.views.generic.base import View
from .models import Project, Tag,Return
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import ProjectForm,ReturnForm
from user.models import MemberProfile
from utils.decorators import login_required


class IndexView(View):
    def get(self, request):
        hot_projects = Project.objects.all().order_by('-supporters')[:3]
        tech_projects = Project.objects.filter(type=0).order_by('-supporters')[:4]
        design_projects = Project.objects.filter(type=1).order_by('-supporters')[:4]
        agr_projects = Project.objects.filter(type=3).order_by('-supporters')[:4]
        other_projects = Project.objects.filter(Q(type=2) | Q(type=4)).order_by('-supporters')[:4]
        context = {
            'hot_projects': hot_projects,
            'tech_projects': tech_projects,
            'tech_project': tech_projects[0],
            'design_projects': design_projects,
            'design_project': design_projects[0],
            'agr_projects': agr_projects,
            'agr_project': agr_projects[0],
            'other_projects': other_projects,
        }
        return render(request, 'index.html', context)


# 项目详情页
class ProjectInfoView(View):
    def get(self, request, project_id):
        project = Project.objects.get(id=project_id)
        context = {
            'project': project
        }
        return render(request, 'project.html', context)


# 项目列表页
class ProjectListView(View):
    def get(self, request):

        all_projects = Project.objects.all()

        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_projects = all_projects.filter(name__icontains=search_keywords)

        type = request.GET.get('type', '')
        if type:
            all_projects = all_projects.filter(type=int(type))

        status = request.GET.get('status', '')
        if status:
            all_projects = all_projects.filter(status=int(status))

        sort = request.GET.get('sort', '')
        if sort == 'deploy_date':
            all_projects = all_projects.order_by('-deploy_date')
        elif sort == 'target_money':
            all_projects = all_projects.order_by('-target_money')
        elif sort == 'supporters':
            all_projects = all_projects.order_by('-supporters')

        project_num = all_projects.count()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_projects, 1, request=request)
        all_projects = p.page(page)

        context = {
            'all_projects': all_projects,
            'project_num': project_num,
            'type': type,
            'status': status,
            'sort': sort
        }
        return render(request, 'projects.html', context)


class StartProjectView(View):
    def get(self, request):
        return render(request, 'start.html')


# 项目发起信息
class Step1View(View):
    def get(self, request):
        tags = Tag.objects.all()
        context = {
            'tags': tags,
        }
        return render(request, 'start-step-1.html', context)

    def post(self, request):
        form = ProjectForm(request.POST, request.FILES)
        member = MemberProfile.objects.get(id=request.session['user_id'])


        if form.is_valid():
            project = Project()

            project.member = member

            tag_list = request.POST.getlist('tag')
            tag = ','.join(tag_list)
            project.tag = tag

            project_type = request.POST.get('project_type')
            project.type = int(project_type)

            name = request.POST.get('name')
            project.name = name

            remark = request.POST.get('remark')
            project.remark = remark

            target_money = request.POST.get('target_money')
            project.target_money = target_money

            period = request.POST.get('period')
            project.period = period

            project_cover = request.FILES['project_cover']
            project.project_cover = project_cover

            project_info = request.FILES['project_info']
            project.project_info = project_info

            a_word_intro = request.POST.get('a_word_intro')
            project.a_word_intro = a_word_intro

            self_intro = request.POST.get('self_intro')
            project.self_intro = self_intro

            phone_number = request.POST.get('phone_number')
            project.phone_number = phone_number

            service_number = request.POST.get('service_number')
            project.service_number = service_number

            project.save()
            request.session['project_id'] = project.id
            return render(request, 'start-step-2.html')
        else:
            tags = Tag.objects.all()
            context = {
                'tags': tags,
                'errors': form.errors,
            }
            # return redirect(reverse('project:step1',context))
            # 完善好了指向start-step-1.html
            return render(request, 'start-step-2.html', context)


# 回报设置
class Step2View(View):
    def get(self, request):
        return_objects = Return.objects.all()
        context = {
            'return_objects': return_objects,
        }
        return render(request, 'start-step-2.html',context)

    def post(self,request):
        form = ReturnForm(request.POST,request.FILES)

        if form.is_valid():
            return_object = Return()

            project = Project.objects.get(id=int(request.session['project_id']))
            return_object.project = project

            return_type = request.POST.get('type')
            return_object.type = int(return_type)

            support_money = request.POST.get('support_money')
            return_object.support_money = support_money

            content = request.POST.get('content')
            return_object.content = content

            img = request.FILES['img']
            return_object.img = img

            return_num = request.POST.get('return_num')
            return_object.return_num = return_num

            limit_or_not = request.POST.get('limit_or_not')
            return_object.limit_or_not = int(limit_or_not)

            # 单笔限购数量
            one_order_limit = request.POST.get('one_order_limit','0')
            if one_order_limit:
                return_object.one_order_limit = int(one_order_limit)

            trans_expenses = request.POST.get('trans_expenses')
            return_object.trans_expenses = trans_expenses

            invoice = request.POST.get('invoice')
            return_object.invoice = invoice

            return_days = request.POST.get('return_days')
            return_object.return_days = return_days

            return_object.save()

            return redirect(reverse('project:step2'))
        else:
            errors = form.errors
            return_objects = Return.objects.all()
            context = {
                'errors':errors,
                'return_objects':return_objects,
            }
            return render(request,'start-step-2.html',context)


class Step3View(View):
    def get(self, request):
        return render(request, 'start-step-3.html')


class Step4View(View):
    def get(self, request):
        return render(request, 'start-step-4.html')
