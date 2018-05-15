from django.shortcuts import render
from django.views.generic.base import View
from .models import Project, Banner, PorjectTag,ProjectType
from users.models import Advertisement
from pure_pagination import Paginator, PageNotAnInteger
from users.forms import UploadForm
from users.models import UserProfile

#项目主页
class ProjectIndex(View):
    def get(self, request):
        project_info = Project.objects.all()
        order_project = Advertisement.objects.order_by('-id')[:3]
        banners = Banner.objects.all()
        print(banners)
        for i in order_project:
            print(i)
        return render(request, 'index.html', {'project_info': project_info,
                                              'order_project': order_project,
                                              'banners': banners})
    def post(self, request):
        pass


#项目详情页
class ProjectdDetail(View):
    def get(self, request, project_id):
        project_info = Project.objects.filter(id=project_id)
        order_project = Project.objects.order_by('-id')[:2]
        project = Project.objects.get(id=project_id)
        user_info = project.userprofile_set.all()


        return render(request, 'project.html', {'project_info': project_info,
                                                'user_info': user_info,
                                                'order_project': order_project})

#项目总览
class Projects(View):
    def get(self, request):
        project = Project.objects.all()
        user = request.user

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(project, 1, request=request)
        projects = p.page(page)
        return render(request, 'projects.html', {'projects': projects,
                                                 'user': user} )
# 发起众筹
class SendCrowd(View):
    def get(self, request):
        user = request.user
        print(user)
        return render(request, 'start.html', {'user': user})




class SendProject(View):
    def get(self, request):
        print('get')
        pro_type = ProjectType.objects.all()
        tags = PorjectTag.objects.all()
        return render(request, 'start-step-1.html', {'tags': tags,
                                                     'pro_type':pro_type})
    def post(self, request):
        print('post')
        form = UploadForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            image = form.cleaned_data['image']
            infoimage = form.cleaned_data['infoimage']
            print(image)
            print(infoimage)
            project_type = request.POST.get('inlineRadioOptions', '')
            print(project_type)
            name = request.POST.get('name', '')
            print(name)
            remark = request.POST.get('remark', '')
            print(remark)
            Target_amount = request.POST.get('Target_amount', '')
            print(Target_amount)
            day = request.POST.get('day', '')
            print(day)
            my_info = request.POST.get('my_info', '')
            print(my_info)
            my_infos = request.POST.get('my_infos', '')
            print(my_infos)
            phone = request.POST.get('phone', '')
            print(phone)
            service = request.POST.get('service', '')
            print(service)
            tagname = request.POST.getlist('tagname', '')
            print(tagname)

            project = Project()
            project.image = image
            project.infoimage = infoimage
            pro_type = ProjectType.objects.get(name=project_type)
            project.project_type=pro_type
            project.name = name
            project.remark = remark
            project.Target_amount = Target_amount
            project.day = day
            project.my_info = my_info
            project.my_infos = my_infos
            project.phone = phone
            project.service = service
            project.tagname = tagname
            project.save()

            return render(request, 'start-step-2.html', {'name':name})

class Rerurn(View):
    def get(self, request):
        print('get')
        return render(request, 'start-step-2.html')

    def post(self, request):
        print('post')
        return_type = request.POST.get('inlineRadioOptions')
        print(return_type)
        supportmoney = request.POST.get('supportmoney')
        print(supportmoney)
        content = request.POST.get('content')
        print(content)
        retimage = request.POST.get('retimage')
        print(retimage)





        return  render(request, 'start-step-2.html')
