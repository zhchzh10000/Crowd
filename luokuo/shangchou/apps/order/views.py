from django.shortcuts import render

# Create your views here.
from django.views.generic.base import View


class Pay_One_View(View):
	def get(self,request):
		return render(request,'pay-step-1.html')


class Pay_Two_View(View):
	def get(self,request):
		return render(request,'pay-step-2.html')

