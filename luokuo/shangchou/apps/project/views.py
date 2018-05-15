from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from project.models import Project
from user.models import Banner


class ProList(View):
	def get(self, request):
		projects = Project.objects.all()
		category = request.GET.get('ct','')
		status = request.GET.get('status','')
		if status:
			projects = projects.filter(status=status)
		if category:
			projects = projects.filter(category=category)
		sort = request.GET.get('sort', '')
		if sort == 'deploydate':
			projects = projects.order_by('-deploydate')
		elif sort == 'supporter':
			projects = projects.order_by('-supporter')
		elif sort == 'supportmoney':
			projects = projects.order_by('-supportmoney')

		# 筛选完成之后再进行统计
		num = projects.count()

		try:
			page = request.GET.get('page',1)
		except PageNotAnInteger:
			page = 1
		p = Paginator(projects, 4, request=request)
		projects = p.page(page)

		return render(request,'projects.html',{'projects':projects,'category':category,'status':status,'num':num,'sort':sort})


class ProView(View):
	def get(self,request,pro_id):
		project = Project.objects.get(id=int(pro_id))
		return render(request,'project.html',{'project':project})


class IndexView(View):
	def get(self,request):
		projects = Project.objects.all()
		banners = Banner.objects.all()
		hot = Project.objects.all().order_by('-supporter')[:3]
		st = Project.objects.filter(category='st')[:4]
		design = Project.objects.filter(category='design')[:4]
		ag = Project.objects.filter(category='ag')[:4]
		pw = Project.objects.filter(category='pw')[:4]
		other = Project.objects.filter(category='cu')[:4]

		return render(request,'index.html',{
			'projects':projects,
			'banners':banners,
			'hot':hot,
			'sts':st,
			'designs':design,
			'ags':ag,
			'others':other,
			'pw':pw,
		})
