from django.shortcuts import render


# Create your views here.
from django.template.context_processors import request

from startpro.models import Startpro, Tag




#标签

def StartStepOne(self,request):
	lables = Startpro.objects.all()
	tags = Tag.objects.getlist()
	context = {
		'tags':tags,
		'lables':lables,
	}
	return render(request,'store/start-step-1.html',context=context)









# def StartStepOne(request):
# 	return render(request,'start-step-1.html')

def StartStepTwo(request):
	return render(request,'start-step-2.html')

def StartStepThree(request):
	return render(request,'start-step-3.html')

def StartStepFour(request):
	return render(request,'start-step-4.html')








