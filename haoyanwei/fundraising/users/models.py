from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime

# Create your models here.


'''会员表'''
class User(AbstractUser):
	login_acct = models.CharField(max_length=255,verbose_name='登录账户')
	authstatus = models.CharField(choices=(('0','未登录'),('1','实名认证申请中'),('2','已实名认证')),verbose_name='实名认证状态',max_length=1)
	user_type = models.CharField(max_length=1,choices=(('0','个人'),('1','企业')),verbose_name='用户类型')
	real_name = models.CharField(max_length=255,verbose_name='真实名称')
	cardnum = models.CharField(max_length=255,verbose_name='身份证号')
	accttye = models.CharField(max_length=1,choices=(('0','企业'),('1','个体'),('2','个人'),('3','政府')),verbose_name='账目类型')
	show = models.CharField(max_length=255,verbose_name='自我介绍')
	detail_show = models.TextField(verbose_name='详细自我介绍')
	phone = models.CharField(max_length=11,verbose_name='联系电话')
	service_phone = models.CharField(max_length=11,verbose_name='客服电话')

	class Meta:
		verbose_name = '用户表'
		verbose_name_plural = verbose_name



'''会员地址表'''
class MemberAddress(models.Model):
	memberid = models.ForeignKey(User,max_length=11,verbose_name='会员id')
	address = models.CharField(max_length=255,verbose_name='地址')
	class Meta:
		verbose_name = '会员地址表'
		verbose_name_plural = verbose_name


#Banner图
class Banner(models.Model):
	title = models.CharField(max_length=100, verbose_name=u"标题")
	image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
	url = models.URLField(max_length=200, verbose_name=u"访问地址")
	index = models.IntegerField(default=100, verbose_name=u"顺序")
	add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

	class Meta:
		verbose_name = u"轮播图"
		verbose_name_plural = verbose_name

'''邮箱'''
class EmailVerifyRecord(models.Model):
	code = models.CharField(max_length=20, verbose_name=u"验证码")
	email = models.EmailField(max_length=50, verbose_name=u"邮箱")
	send_type = models.CharField(choices=(("register", "注册"), ("forget", u"找回密码")), max_length=15)
	send_time = models.DateTimeField(default=datetime.now)

	class Meta:
		verbose_name = u"邮箱验证码"
		verbose_name_plural = verbose_name


