from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger

from projects.models import Project
from user.models import UserProfile


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
		p = Paginator(projects, 2, request=request)
		projects = p.page(page)

		return render(request,'projects.html',{'projects':projects,'category':category,'status':status,'num':num,'sort':sort})

