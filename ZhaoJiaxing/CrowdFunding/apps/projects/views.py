import time
import os
from datetime import datetime, timedelta

from django.db.models import Q, F
from django.shortcuts import render
from django.views.generic.base import View
from django.http import JsonResponse, HttpResponse
from django.core.files.storage import default_storage

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from projects.models import Project, ProjectItem, ProjectCategory, ProjectTags, Company
from operations.models import UserInterest
from CrowdFunding.settings import MEDIA_ROOT

# Create your views here.


class ProjectListView(View):
    def get(self, request):
        project_list = Project.objects.exclude(status='failed')
        category_list = ProjectCategory.objects.all()

        search = request.GET.get('search', '')
        if search:
            project_list = project_list.filter(Q(name__icontains=search) | Q(desc__icontains=search))

        category = request.GET.get('cg', '')
        cgn = ''
        if category:
            project_list = project_list.filter(category_id=category)
            cgn = ProjectCategory.objects.get(id=category).name
        status = request.GET.get('st', '')

        if status:
            project_list = project_list.filter(status=status)

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'new':
                project_list = project_list.order_by('create_time')
            if sort == 'tf':
                project_list = project_list.order_by('-support_fund')
            if sort == 'sn':
                project_list = project_list.order_by('-support_nums')

        project_nums = project_list.count()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(project_list, 8, request=request)
        project_list = p.page(page)
        return render(request, 'projects.html', {'project_list': project_list,
                                                 'project_nums': project_nums,
                                                 'category_list': category_list,
                                                 'sort': sort,
                                                 'cg': category,
                                                 'cgn': cgn,
                                                 'st': status,
                                                 'search': search})


class ProjectDetailView(View):
    def get(self, request, project_id):
        has_interest = UserInterest.objects.filter(user_id=request.user.id, project_id=project_id)
        if not has_interest:
            has_interest = ''
        else:
            has_interest = has_interest[0]
        project = Project.objects.get(id=project_id)
        project.deadline_time = project.create_time + timedelta(days=project.deadline)
        project_items = ProjectItem.objects.filter(project=project)
        recommend_list = Project.objects.all().order_by('-support_fund')[:2]
        return render(request, 'project.html', {'project': project,
                                                'project_items': project_items,
                                                'recommend_list': recommend_list,
                                                'has_interest': has_interest, })


class CreateProjectStepView(View):
    def get(self, request, step):
        if step == 0:
            return render(request, 'start.html')
        if step == 1:
            category_list = ProjectCategory.objects.all()
            tag_list = ProjectTags.objects.all()
            return render(request, 'start-step-1.html', {'category_list': category_list,
                                                         'tag_list': tag_list, })
        if step == 2:
            return render(request, 'start-step-2.html')
        if step == 3:
            return render(request, 'start-step-3.html')
        if step == 4:
            return render(request, 'start-step-4.html')

    def post(self,request,step):
        if step == 2:
            params = dict(request.POST)
            image_first_filename = str(int(time.time())) + request.FILES['project_image_first'].name
            file_obj = request.FILES['project_image_first']
            with default_storage.open(MEDIA_ROOT+'/uploadimage/' + image_first_filename, 'wb+') as file:
                for chunk in file_obj.chunks():
                    file.write(chunk)
            image_first_upload = 'uploadimage/' + image_first_filename
            params['project_image_first'] = image_first_upload

            image_detail_filename = str(int(time.time())) + request.FILES['project_image_detail'].name
            file_obj = request.FILES['project_image_detail']
            with default_storage.open(MEDIA_ROOT+'/uploadimage/' + image_detail_filename, 'wb+') as file:
                for chunk in file_obj.chunks():
                    file.write(chunk)
            image_detail_upload = 'uploadimage/' + image_detail_filename
            params['project_image_detail'] = image_detail_upload

            project = Project()
            project.name = request.POST['project_name']
            project.desc = request.POST['project_desc']
            project.target_fund = request.POST['project_target_fund']
            project.deadline = request.POST['project_deadline']
            project.user_desc = request.POST['project_user_desc']
            project.user_detail = request.POST['project_user_detail']
            project.mobile = request.POST['project_mobile']
            project.service_mobile = request.POST['project_service_mobile']
            project.image_first = params['project_image_first']
            project.image_detail = params['project_image_detail']
            project.admin_id = request.user.id
            project.category_id = request.POST['project_category']
            project.company_id = Company.objects.get(admin_id=project.admin_id).id
            project.tags_id = 1
            project.save()
            request.session['temp_project_id'] = project.id
            return JsonResponse({'status':'success'})

        if step == 3:
            params = dict(request.POST)
            item_image_filename = str(int(time.time())) + request.FILES['item_image'].name
            file_obj = request.FILES['item_image']
            with default_storage.open(MEDIA_ROOT+'/uploadimage/' + item_image_filename, 'wb+') as file:
                for chunk in file_obj.chunks():
                    file.write(chunk)
            item_image_upload = 'uploadimage/' + item_image_filename
            params['item_image'] = item_image_upload

            project_item = ProjectItem()
            project_item.item_category = request.POST['item_category']
            project_item.item_value = request.POST['item_value']
            project_item.how_to_get = request.POST['how_to_get']
            project_item.item_nums = request.POST['item_nums']
            project_item.up_to_buy = request.POST['up_to_buy']
            project_item.project_id = request.session['temp_project_id']
            project_item.invoice = request.POST['invoice']
            project_item.item_send_day = request.POST['item_send_day']
            project_item.item_image = params['item_image']
            project_item.support_nums = 0 if not request.POST['support_nums'] else request.POST['support_nums']
            project_item.item_freight = int(request.POST['item_freight'])
            project_item.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
