from django.shortcuts import render,redirect
from django.views.generic.base import View
from django.core.urlresolvers import reverse
from django.http import HttpResponse,JsonResponse
from .models import ProjectInfo,RepayInfo,UserFavProject
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q

'''
项目详情
'''
class ProjectDetailView(View):
    def get(self, request,project_id):
        project = ProjectInfo.objects.get(id=project_id)

        been_fav = '0'
        try:
            userfav = UserFavProject.objects.get(user=request.user,project_id=project_id)
        except Exception as e:
            pass
        else:
            been_fav = '1'
            
        all_repay = project.repayinfo_set.all().order_by('support_money')
        
        other_project = ProjectInfo.objects.all().order_by('-fav_num')[:2]
        
        
        context = {
            'project': project,
            'all_repay':all_repay,
            'other_project':other_project,
            'been_fav':been_fav,
            
        }
        return render(request, 'project/project_detail.html', context=context)


'''
项目列表
'''
class ProjectListView(View):
    def get(self, request):
        all_project = ProjectInfo.objects.all()

        keywords = request.GET.get('keywords', '')
        
        # 加入搜索词排序，并且在前端的链接中加入关键词，返回到前端页面中，使每次分类搜索的排序都会带上吃关键词
        if keywords:
            all_project = all_project.filter(
                Q(name__contains=keywords)|
                Q(desc__contains=keywords)|
                Q(detail_intro__contains=keywords)
            )
      
        # 按分类排序
        sort = request.GET.get('sort','')
        if sort:
            all_project = all_project.filter(category=sort)
            
        # 按状态排序
        status = request.GET.get('status','')
        if status:
            all_project = all_project.filter(active_status=status)
            
        # 按最新，支持金额，支持人数排序
        order = request.GET.get('order','')
        if order == 'new':
            all_project = all_project.order_by('-create_time')
        elif order == 'money':
            all_project = all_project.order_by('-raised_money')
        elif order == 'support':
            all_project = all_project.order_by('-support_people')

        all_num = all_project.count()
        
        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_project, 1,request=request)

        p_project = p.page(page)
        
        context = {
            'p_project':p_project,
            'all_num':all_num,
            'sort':sort,
            'status':status,
            'order':order,
            'keywords':keywords,
        }
        return render(request, 'project/project_list.html',context=context)

'''
项目添加到关注
'''
class AddFavView(View):
    def set_fav_nums(self,pro_id,num=1):
        proinfo = ProjectInfo.objects.get(id=pro_id)
        proinfo.fav_num += num
        proinfo.save()

        
    def post(self,request):
        pro_id = int(request.POST.get('pro_id',0))
        
        res = dict()
        if not request.user.is_authenticated():
            res['status'] = 'fail'
            res['msg'] = '用户未登录！'
            return JsonResponse(res)

        exist_records = UserFavProject.objects.filter(user=request.user,project_id=pro_id)
        if exist_records:
            exist_records.delete()
            self.set_fav_nums(pro_id,-1)
            res['status'] = 'success'
            res['num'] = 0
            res['msg'] = '关注'
        else:
            user_fav = UserFavProject()
            if pro_id:
                user_fav.user = request.user
                user_fav.project_id = pro_id
                user_fav.save()
                self.set_fav_nums(pro_id,1)
                res['msg'] = '已关注'
                res['num'] = 1
                res['status'] = 'success'
            else:
                res['status'] = 'fail'
                res['msg'] = '关注出错'
        return JsonResponse(res)
