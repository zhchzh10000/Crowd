from django.shortcuts import render,render_to_response
from django.http import HttpResponse,HttpResponseRedirect

from django.views.generic import View
from .models import Project,ProjectName,Company,Label,Return
from django.contrib.auth import authenticate,login,logout
from users.forms import LoginForm
from utils.mixin_utils import LoginRequiredMixin
from django.db.models import Q

from users.forms import UploadForm,ImageForm

from pure_pagination import Paginator,PageNotAnInteger,EmptyPage



#众筹商品详情页
class ProjectDetailView(View):
    def get(self,request,project_id):
        project = Project.objects.get(id=int(project_id))
        companys = project.company
        recomends = Project.objects.all()[:3]
        return render(request,'project.html',{
            'recomends':recomends,
            'companys':companys,
            'project':project
        })


#众筹商品列表页
class ProjectList(View):
    def get(self,request):
        projects = Project.objects.all()

        sorts = request.GET.get('sorts','')
        print(sorts)
        if sorts:
            if sorts == 'kj':
                tag = ProjectName.objects.get(pyname='科技')
                projects = Project.objects.filter(projectname=tag)
            elif sorts == 'sj':
                tag = ProjectName.objects.get(pyname='设计')
                projects = Project.objects.filter(projectname=tag)
            elif sorts == 'gy':
                tag = ProjectName.objects.get(pyname='公益')
                projects = Project.objects.filter(projectname=tag)
            elif sorts == 'ny':
                tag = ProjectName.objects.get(pyname='农业')
                projects = Project.objects.filter(projectname=tag)
            elif sorts == 'wh':
                tag = ProjectName.objects.get(pyname='文化')
                projects = Project.objects.filter(projectname=tag)
        #状态类别筛选
        status = request.GET.get('st','')
        if status:
            projects = projects.filter(status=status)

#排序’‘
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'end_money':
                projects = projects.order_by('-end_money')
            elif sort == 'supporter':
                projects = projects.order_by('-supporter')
            elif sort == 'add_time':
                projects = projects.order_by('-add_time')

                # 课程搜索设置
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            projects = projects.filter(
                Q(name__icontains=search_keywords) | Q(detail__icontains=search_keywords))

        num = projects.count()
        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(projects, 2, request=request)
        projected = p.page(page)

        return render(request,'projects.html',{
            'projects':projected,
            'sort':sort,
            'status':status,
            'sorts':sorts,
            'num':num
        })


#众筹的开始提示
class ProjectStart(View):
    def get(self,request):
        return render(request,'start.html',{})


#发起众筹 第一步
class ProjectFirst(View):

    def get(self,request):
        tags = ProjectName.objects.all()
        labels = Label.objects.all()
        return render(request,'start-step-1.html',{
            'tags':tags,
            'labels':labels
        })

    def post(self,request):
        form = UploadForm(request.POST,request.FILES)
        if form.is_valid():
            image_head = form.cleaned_data['image_head']
            image_body = form.cleaned_data['image_body']
            name = request.POST.get('name','')
            end_money = request.POST.get('end_money','')
            time = request.POST.get('time','')
            detail = request.POST.get('detail','')

            project_user = Project()
            project_user.image_head = image_head
            project_user.image_body = image_body
            project_user.name = name
            project_user.end_money =end_money
            project_user.time = time
            project_user.detail = detail
            project_user.save()

            label = request.POST.getlist('label','')
            lables = Label()
            lables.label = label
            lables.save()

            pyname = request.POST.get('pyname','')
            pynames = ProjectName()
            pynames.pyname = pyname

            phone = request.POST.get('phone','')
            mobile = request.POST.get('mobile','')
            userdesc = request.POST.get('userdesc','')
            userdetail = request.POST.get('userdetail','')
            company_phone = Company()
            company_phone.phone = phone
            company_phone.mobile = mobile
            company_phone.userdesc = userdesc
            company_phone.userdetail = userdetail
            company_phone.save()

            return render(request,'start-step-2.html')



#发起众筹第二步
class ProjectSencend(View):
    def get(self,request):
        return render(request,'start-step-2.html',{})

    def post(self,request):
        form = ImageForm(request.POST,request.FILES)
        if form.is_valid():
            image_re = form.cleaned_data['image_re']
            type = request.POST.get('type', '')
            content = request.POST.get('content', '')
            supportmoney = request.POST.get('supportmoney', '')
            count = request.POST.get('count', '')
            invoice = request.POST.get('invoice', '')
            signalpurchase = request.POST.get('signalpurchase', '')
            buy = request.POST.get('buy', '')
            rtndate = request.POST.get('rtndate', '')

            returns = Return()
            returns.image_re = image_re
            returns.type = type
            returns.content = content
            returns.supportmoney = supportmoney
            returns.count = count
            returns.invoice = invoice
            returns.signalpurchase = signalpurchase
            returns.buy = buy
            returns.rtndate = rtndate
            returns.save()

            return render(request,'start-step-2.html')



class ProjectThree(View):
    def get(self,request):
        return render(request,'start-step-3.html')


class ProjectFour(View):
    def get(self,request):
        return render(request,'start-step-4.html')


#众筹第三步  确认信息


#众筹第四部， 完成众筹，




#我的众筹详情页
class ProjectMineCrow(LoginRequiredMixin,View):
    def get(self,request):
        return render(request,'minecrowdfunding.html')

#众筹的钱包金额展示
class ProjectOurCrow(LoginRequiredMixin,View):
    def get(self,request):
        return render(request,'member.html',{})


class Poe(View):
    def post(self,request):
        tag = request.POST['tag']
        ta = ProjectName()
        ta.name = tag
        ta.save()