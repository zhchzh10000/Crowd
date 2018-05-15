from django.db.models import Q
from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger
from projects.models import TProject, TTag
from datetime import datetime

class goodsListView(View):
	def get(self, request):
		projects = TProject.objects.all()
		search_keywords = request.GET.get('keywords', '')
		if search_keywords:
			projects = projects.filter(
				Q(is_category__icontains=search_keywords) |
				Q(name__icontains=search_keywords) |
				Q(describe__icontains=search_keywords)
			)

		tags = TTag.objects.all()
		project_nums = projects.count()
		sort = request.GET.get('sort', '')
		category = request.GET.get('ct', '')
		status = request.GET.get('status', '')
		if sort == 'daploydate':
			projects = projects.order_by('-daploydate')
		elif sort == 'supporter':
			projects = projects.order_by('-supporter')
		elif sort == 'supportmoney':
			projects = projects.order_by('-supportmoney')
		if status == '0':
			projects = projects.filter(status = '0')
		elif status == '1':
			projects = projects.filter(status = '1')
		elif status == '2':
			projects = projects.filter(status = '2')
		elif status == '3':
			projects = projects.filter(status = '3')
		if category:
			projects = projects.filter(is_category=category)

		try:
			page = request.GET.get('page', 1)
		except PageNotAnInteger:
			page = 1

		p = Paginator(projects, 4, request=request)

		projects = p.page(page)
		return render(request, 'projects.html', {'projects': projects,
												 'project_nums': project_nums,
												 'tag_list': tags,
												 'sort': sort,
												 'category': category,
												 'status': status,
												 })

class ProjectDetailViev(View):
	def get(self,request,pro_id):
		project = TProject.objects.get(id=int(pro_id))
		starttime = project.enddate
		print(starttime)
		endtime = datetime.now()
		starttime = datetime.strptime(starttime.strftime('%Y-%m-%d'),'%Y-%m-%d')
		endtime = datetime.strptime(endtime.strftime('%Y-%m-%d'),'%Y-%m-%d')
		remain_time = (starttime-endtime).days


		# # if remain_time <= 0
		# 	nowmoney = project.get('money')
		# 	sportmone
		# 	project.status = ''


		return render(request,'project.html',{'project':project,
											  'remain_time':remain_time
											  })
# 发起众筹
class startProjectView(View):
	def get(self,request):
		return render(request,'start.html')
class startProject1View(View):
	def get(self,request):
		return render(request,'start-step-1.html')