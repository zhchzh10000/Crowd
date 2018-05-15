from django.shortcuts import render
from django.views.generic.base import View
from user.models import UserProfile,Cert
from project.models import Project


class Start_Crowdfunding(View):
	def get(self,request):
		return render(request,'start.html')


class Start_Step1(View):
	def get(self,request):
		return render(request,'start-step-1.html')
	def post(self,request):
		user = UserProfile()
		cert = Cert()
		pro = Project()
		user.mobile = request.POST.get('mobile','')
		cert.cert_company = request.POST.get('cert_company','')
		cert.cert_info = request.POST.get('cert_info','')
		cert.cert_phone = request.POST.get('cert_phone','')
		pro.name = request.POST.get('name','')
		pro.info = request.POST.get('info','')
		pro.money = request.POST.get('money','')
		pro.day = request.POST.get('day','')
		pro.image = request.POST.get('image','')
		pro.image_detail = request.POST.get('image_detail','')
		user.save()
		pro.save()
		cert.save()
		return render(request,'start-step-2.html')

class Start_Step2(View):
	def get(self,request):
		return render(request,'start-step-2.html')
	def post(self,request):
		return render(request,'start-step-3.html')

class Start_Step3(View):
	def get(self,request):
		return render(request,'start-step-3.html')
	def post(self,request):
		return render(request,'start-step-4.html')


class Start_Step4(View):
	def get(self,request):
		return render(request,'start-step-4.html')
	def post(self,request):
		return render(request,'minecrowdfunding.html')


