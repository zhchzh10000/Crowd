from django.shortcuts import render
from django.views.generic import View
from django.db.models import Q
import json
from logincheck.LoginCheck import login_required
from django.http import JsonResponse,HttpResponse
from pure_pagination import Paginator,PageNotAnInteger
from .models import ProductMsg,ProFollow
from users.models import UserMsg
# Create your views here.


class Index(View):
    def get(self,request):
        return render(request,'html/index.html',{'ProductMsg':ProductMsg})
    def post(self,request):
        pass


class ProductsList(View):
    def get(self,request):
        projectslist = ProductMsg.objects.all().order_by('add_time')
        sort = request.GET.get('sort','')
        sort1 = request.GET.get('sort1','')
        sort2 = request.GET.get('sort2','')
        if sort:
            if sort == 'price':
                projectslist = projectslist.order_by('-target_price')
            if sort == 'supper':
                projectslist = projectslist.order_by('-support_num')

        if sort1:
            if sort1 == 'start':
                projectslist = projectslist.filter(mode=0)
            if sort1 == 'run':
                projectslist = projectslist.filter(mode=1)
            if sort1 == 'success':
                projectslist = projectslist.filter(mode=2)

        if sort2:
            if sort2 == 'science':
                projectslist = projectslist.filter(type=0)
            if sort2 == 'design':
                projectslist = projectslist.filter(type=1)
            if sort2 == 'commonweal':
                projectslist = projectslist.filter(type=2)
            if sort2 == 'farm':
                projectslist = projectslist.filter(type=3)
            if sort2 == 'culture':
                projectslist = projectslist.filter(type=4)
        num = projectslist.count()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(projectslist, 4, request=request)
        projectslist = p.page(page)
        return render(request,'html/projects.html',{'projectslist':projectslist,
                                                        'sort':sort,
                                                        'sort1': sort1,
                                                        'sort2': sort2,
                                                        'num':num
                                                    })
    def post(self,request):
        projectslist = ProductMsg.objects.all()
        search_keywords = request.POST.get('key_word')
        if search_keywords:
            projectslist = projectslist.filter(
                Q(name__icontains=search_keywords) |
                Q(desc__icontains=search_keywords)|
                Q(company__name__icontains=search_keywords)
            )
        num = projectslist.count()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(projectslist, 4, request=request)
        projectslist = p.page(page)
        return render(request, 'html/projects.html', {'projectslist': projectslist,'num':num})

class ProductDe(View):
    def get(self,request,pro_id):
        product = ProductMsg.objects.get(id=pro_id)
        company = product.company
        if company:
            company = company
            return  render(request,'html/project.html',{'company':company,'product':product})
        return render(request,'html/index.html',{'ProductMsg':ProductMsg})


class Follow(View):
    def post(self,request):
        fav_id = int(request.POST.get('fav_id', ''))
        res =dict()
        try:
            user_id = request.session._session['user_id']
        except:
            res['status'] = 'fail'
            res['msg'] = '用户没登陆'
            return HttpResponse(json.dumps(res),content_type='application/json')
        user = UserMsg.objects.get(id=user_id)
        exist_records = ProFollow.objects.filter(user=user,fav_id=fav_id)
        pro = ProductMsg.objects.get(id=fav_id)
        fav_user = ProFollow()
        if exist_records:
            exist_records.delete()
            pro.follow -= 1
            pro.save()
            res['status'] = 'success'
            res['msg'] = '取消收藏'
            return HttpResponse(json.dumps(res), content_type='application/json')
        else:
            fav_user.user = user
            fav_user.fav_id = fav_id
            fav_user.save()
            pro.follow +=1
            pro.save()
            res['status'] = 'success'
            res['msg'] = '收藏成功'
            return HttpResponse(json.dumps(res), content_type='application/json')


class StartPro(View):
    def get(self,request):
        return render(request,'html/start-step-1.html')

    # @login_required
    # 具体实现，验证，然后新建表单提交到待审核的models里面，等待审核，这几个表单和原product表单相对
    def post(self,request):
        type = request.POST.get('inlineRadioOptions')
        pro_name = request.POST.get('pro_name')
        pro_desc = request.POST.get('pro_desc')
        target_price = request.POST.get("target_price")
        target_day = request.POST.get('target_day')
        company_name = request.POST.get('youself')
        company_desc = request.POST.get('youself_dec')
        company_phone = request.POST.get('telphone')
        imagehead_file  = request.FILES.get('image1')
        imageDesc_file = request.FILES.get('image2')
        product = ProductMsg()
        product.type = int(type)
        product.name = pro_name
        product.desc = pro_desc
        product.target_price = target_price
        product.fin_day = target_day
        product.image = imagehead_file
        product.image_dec = imageDesc_file
        product.save()
        return render(request,'html/start-step-2.html')


class NextPro(View):
    def get(self,request):
        return render(request,'html/start-step-2.html')
    def post(self,request):
        retype = request.POST.get('inlineRadioOptions')
        supper_price = request.POST.get('supper_price')
        recon = request.POST.get('recon')
        explainImage = request.FILES.get('image')
        re_num = request.POST.get('re_num')
        num_type = request.POST.get('inlineRadioOptions2')
        buy_num = request.POST.get('buy_num')
        fare_price = request.POST.get('fare_price')
        is_bill = request.POST.get('inlineRadioOptions3')
        re_day = request.POST.get('re_day')
        return render(request, 'html/start-step-3.html')

class Finally(View):
    def get(self,request):
        return render(request,'html/start-step-4.html')

class NextProOther(View):
    def get(self,request):
        return render(request,'html/start-step-3.html')