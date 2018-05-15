import time
from django.contrib.auth.hashers import make_password
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from .forms import RegisterForm,LoginFrom,UploadFileForm,UploadFileForm2
from .models import Member,Project,Tag,Type,Twolable,Order,Return,Follower,Support,MemberAddress,Banner
from apps.PublicDisplay.sendemail import send_register_email
from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
from django.db.models import Q
from django.http import HttpResponse,JsonResponse
import json

from django.views.decorators.csrf import csrf_exempt
# Create your views here.
#首页
class IndexView(View):
	def get(self,request):
		types=Type.objects.all()[:4]
		recommend=Project.objects.order_by('-Follower_nums')[:3]
		banner_list = Banner.objects.all().order_by('-index')[:4]
		return render(request,'index.html',{
			'types':types,
			'recommend':recommend,
			'banner_list':banner_list
		})

'''会员注册'''
class RegisterView(View):
	def get(self,request):
		return render(request,'reg.html',{})

	def post(self,request):
		register_form = RegisterForm(request.POST)
		print(register_form)
		if register_form.is_valid():
			username = request.POST.get('username','')
			password = request.POST.get('password','')
			email = request.POST.get('email','')
			user_type = request.POST.get('user_type','')
			user = Member.objects.filter(username=username)

			if user:
				print('1111')
				return render(request, 'reg.html', {'error': '账户已存在'})
			else:
				print(user_type,type(user_type))
				info = Member()
				info.username = username
				info.password = make_password(password)
				info.email = email
				info.user_type = user_type
				info.is_active = False
				info.save()
				print('2222')
				send_register_email(email)
				return redirect(reverse('login', args=[]))

		else:
			print('3333')
			return render(request,'reg.html',{'error':'校验不通过'})

#登录
class LoginView(View):
	def get(self,request):
		return render(request,'login.html',{})

	def post(self,request):

		login_from = LoginFrom(request.POST)

		if login_from.is_valid():
			username = request.POST.get('username','')
			password = request.POST.get('password','')
			type = request.POST.get('type','')
			print(type)
			user = authenticate(username=username,password=password)
			if login_from.is_valid():
				if str(type) == 'member':
					if user is not None:
						login(request,user)
						return HttpResponseRedirect(reverse('index'))
						# if user.is_active:
						# 	login(request,user)
						# 	print('1111')
						# 	return render(request,'index.html',{})
						# else:
						# 	print('2222')
						# 	return render(request,'login.html',{'msg':'用户未激活'})
					else:
						print('333')
						return render(request,'login.html',{'msg':'用户名密码错误'})

				else:
					print('444')
					return render(request,'login.html',{'msg':'不是后台用户'})

			else:
				print('5555')
				return render(request,'login.html',{'login_from':login_from})

#退出登录
class LogoutView(View):
	def get(self,request):
		logout(request)
		return HttpResponseRedirect(reverse('login'))
#start
class StartView(View):
	def get(self,request):
		return render(request,'start.html',{})

#发起项目

class StartStepView(View):
	def get(self,request):
		type_list = Type.objects.all()
		tag_list = Tag.objects.all()

		return render(request,'start-step-1.html',{
			'type_list':type_list,
			'tag_list':tag_list,
		})
	def post(self,request):
		form = UploadFileForm(request.POST or None, request.FILES or None)
		if form.is_valid():
			headimg = form.cleaned_data['head_img']
			detail_img = form.cleaned_data['detail_img']
			type = request.POST.get('inlineRadioOptions','')
			print('type',type)
			tags = request.POST.getlist('lable','')
			print('tag',tags)
			name = request.POST.get('name','')
			print('name',name)
			remark = request.POST.get('remark','')
			print('remark',remark)
			money = request.POST.get('money','')
			print('monney',money)
			day = request.POST.get('day','')
			print('day',day)
			show = request.POST.get('show','')
			print('show',show)
			detail_show = request.POST.get('detail_show','')
			print('detail_show',detail_show)
			phone = request.POST.get('phone','')
			print('phone',phone)
			service_phone = request.POST.get('service_phone','')
			print('service_phone',service_phone)
			project = Project()
			type = Type.objects.get(name=type)
			project.type = type
			project.name=name
			project.remark = remark
			project.money=money
			project.day=day
			project.memberid=request.user
			project.project_head_img=headimg
			project.project_detail=detail_img
			project.show=show
			project.detail_show=detail_show
			project.phone=phone
			project.service_phone=service_phone
			project.save()

			for tag in tags:
				tag = Twolable.objects.get(name=tag)
				project.tag.add(tag)
			project.save()
			print('project',project.id)
			return render(request,'start-step-2.html',{'project_id':project.id})

#设置回报
class StartStep2View(View):
	def get(self,request):
		return render(request,'start-step-2.html',{})

	def post(self,request,project_id):
		form2 =UploadFileForm2(request.POST or None,request.FILES or None)
		if form2.is_valid():
			explain = form2.cleaned_data['explain']
			type = request.POST.get('type','')
			supportmoney = request.POST.get('supportmoney','')
			content = request.POST.get('content','')
			count = request.POST.get('count','')
			curst = request.POST.get('curst','')
			purchase=''
			if curst == '0':
				print('aaaaaaaaaa')
				purchase='0'
			elif curst == '1':
				print('bbbbbb')
				purchase = request.POST.get('purchase','')
			freight = request.POST.get('invoice','')
			rtndate = request.POST.get('rtndate','')
			project = Project.objects.get(id=int(project_id))
			returns = Return.objects.create(
				projectid=project,
				type=type,
				supportmoney=supportmoney,
				content=content,
				explain=explain,
				count=count,
				purchase=purchase,

				freight=freight,
				rtndate=rtndate
			)
			returns.save()
			return render(request,'start-step-2.html',{'project_id':project_id})

#身份验证
class StartStep3View(View):
	def get(self,request):
		user = request.user
		return render(request,'start-step-3.html',{'user':user})

	def post(self,request):
		email = request.POST.get('email')
		card_id = request.POST.get('card_id')
		user=request.user
		if user:
			if user.email==email and user.cardnum==card_id:
				print('sss')
				return redirect(reverse('start_step_4',args=[]))
			print(email,user.email)
			print(card_id,user.cardnum)
			print('vvvv')
			return render(request,'start-step-3.html',{})

#完成众筹项目
class StartStep4View(View):
	def get(self,request):
		return render(request,'start-step-4.html',{})

#我的众筹页面
class MineCrowFundingView(View):
	def get(self,request):
		user = request.user
		name = user.username
		#获取关注表
		follower=Follower.objects.filter(memberid=user)
		#获取支持表
		support=Support.objects.filter(member=user)


		return render(request,'minecrowdfunding.html',{
			'user':user,
			'follower':follower,
			'support':support
		})

#列表页
class ListView(View):
	def get(self,request):
		projects = Project.objects.all()
		type = Type.objects.all()
		search = request.GET.get('search','')

		if search:

			projects = projects.filter(
				Q(name__icontains=search) |
				Q(money__icontains=search) |
				Q(day__icontains=search)
			)
		#根据类别分类
		types = request.GET.get('types','')

		if types:
			type_name = Type.objects.get(name=types)
			projects=projects.filter(type=type_name)

		#根据状态分类
		status = request.GET.get('status','')
		if status:
			projects = projects.filter(status=status)
		#排序
		order=request.GET.get('order','')
		if order:
			projects=projects.order_by('-'+order)

		try:
			page = request.GET.get('page', 1)
		except PageNotAnInteger:
			page = 1
		p = Paginator(projects, 2, request=request)
		contacts = p.page(page)

		return render(request,'projects.html',{
			'contacts': contacts,
			'type':type,
			'types':types,
			'status':status,
			'order':order
		})
#详情页
class ProjectView(View):
	def get(self,request,project_id):
		recommend = Project.objects.order_by('Follower_nums')[:2]
		project=Project.objects.get(pk=project_id)
		returnss = Return.objects.filter(projectid=project)

		follow=Follower.objects.filter(memberid=request.user,projectid=project)
		follow1=''
		if follow is None:
			follow1='0'
		print(follow1)
		return render(request,'project.html',{
			'project':project,
			'returnss':returnss,
			'recommend':recommend,
			'follow':follow
		})

#支持1
class PayStep1View(View):
	def get(self,request,order_id):
		order = Return.objects.get(pk=order_id)

		return render(request,'pay-step-1.html',{
			'order':order
		})

def generate_order_sn(self):   #订单号
	# 当前时间+userid+随机数
	from random import Random
	random_ins = Random()
	order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.user.id,
                                                       ranstr=random_ins.randint(10, 99))
	return order_sn


@csrf_exempt
def order(request):
	if request.method=='POST':
		#项目id
		project_id=request.POST['project_id']
		project=Project.objects.get(pk=project_id)
		print(project_id)
		#回报id
		returns_id = request.POST['returns_id']
		returns = Return.objects.get(pk=returns_id)
		print(returns_id)
		#数量
		nums=request.POST['nums']
		print(nums)
		#价格
		money=request.POST['money']
		print(money)
		#订单号
		order_id=generate_order_sn(request)
		res=dict()
		try:
			order=Order.objects.create(
				order_id=order_id,
				memberid=request.user,
				projectid=project,
				returnid=returns,
				money=int(nums)*int(returns.supportmoney),
				rtncount=nums,
			)
			order.save()

			res['status']='200'
			res['order_id']=Order.objects.get(order_id=order_id).id
		except Exception as e:
			res['status']='500'
		print(res['status'])
		return HttpResponse(json.dumps(res),content_type='application/json')

#订单2
class PayStep2View(View):
	def get(self,request,order_id):
		order=Order.objects.get(pk=order_id)

		address=MemberAddress.objects.filter(memberid=request.user)
		pay=int(order.money)+int(order.returnid.freight)
		return render(request,'pay-step-2.html',{
			'order':order,
			'address':address,
			'pay':pay
		})
	def post(self,request):
		print('request',request)
		res = dict()
		try:
			addr=MemberAddress.objects.create(
				memberid=request.user,
				name=request.POST['name'],
				phone=request.POST['phone'],
				address=request.POST['address']
			)
		except Exception as e:
			res['status']='500'
			res['error']=e
			return HttpResponse(json.dumps(res), content_type='application/json')
		addr.save()
		res['status']='200'
		return HttpResponse(json.dumps(res),content_type='application/json')
#订单提交
def payment(request):

	print('aaaaaa')
	print(request)
	res=dict()
	if request.method=='POST':
		order_id=request.POST['order_id']
		print(order_id)
		addr=request.POST['addr']
		invoice=request.POST['invoice']
		invoictitle=request.POST['invoictitle']
		remark=request.POST['remark']
		print(addr)
		print(invoictitle)
		print(invoice)
		print(remark)
		try:
			order=Order.objects.get(pk=order_id)
			order.address=addr
			if invoice=='0':
				order.invoice='0'
			elif invoice=='1':
				order.invoice='1'
				order.invoictitle=invoictitle
			order.remark=remark
			res['status']='200'
			return HttpResponse(json.dumps(res),content_type='application/json')
		except Exception as e:
			res['status']='500'
			res['error']=e
			return HttpResponse(json.dumps(res), content_type='application/json')



#关注
def follow(request):
	if request.method=="POST":
		res=dict()

		project_id=request.POST['project']
		print(project_id)
		project=Project.objects.get(pk=project_id)
		record=Follower.objects.filter(memberid=request.user,projectid=project)
		if record:
			record.delete()
			project.Follower_nums=int(project.Follower_nums)-int(1)
			res['msg']='reduce'
			return HttpResponse(json.dumps(res), content_type='application/json')
		else:
			res['msg']='add'
			b=Follower.objects.create(memberid=request.user,projectid=project)
			b.save()



			return HttpResponse(json.dumps(res),content_type='application/json')
