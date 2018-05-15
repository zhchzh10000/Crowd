from django.shortcuts import render

# Create your views here.
from django.views.generic.base import View
from store.models import Prodetail
from users.models import UserFlower,Banner


def index(request):
	banners = Banner.objects.all()
	pro = Prodetail.objects.all()
	return render(request,'index.html',{
		'banners':banners,
		'pro': pro,
	})

def prodetail(request):

	return render(request,'project.html')

def projects(request):
	return render(request,'projects.html')

def start(request):
	return render(request,'start.html')

def minecrowdfunding(request):
	return render(request,'minecrowdfunding.html')

def startstep(request):
	return render(request,'start-step-1.html')









