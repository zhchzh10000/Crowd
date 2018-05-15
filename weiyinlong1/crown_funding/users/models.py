from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime
from db.base_model import BaseModel
from hashlib import sha1
from django.db import models

from store.models import Company


def get_hash(str):
	sh = sha1()
	sh.update(str.encode('utf8'))
	return sh.hexdigest()


class PassportManager(models.Manager):
	def add_one_passport(self,username,password,email):
		'''添加一个账户信息'''
		passport = self.create(username=username, password=get_hash(password),email=email)
		return passport

	def get_one_passport(self,username,password):
		'''根据用户名密码查找账户信息'''
		try:
			passport = self.get(username=username,password=get_hash(password))
		except self.model.DoseNotExist:
			#账户不存在
			passport = None
		return passport


class EmailCode(models.Model):
	code = models.CharField(max_length=20,verbose_name='验证码')
	email = models.EmailField(verbose_name='邮箱',max_length='20')
	send_type = models.CharField(max_length=40,choices=(('register','注册'),('forget','忘记密码'),('update_email','修改邮箱')),verbose_name='验证码类型')
	send_time = models.DateField(default=datetime.now,verbose_name='发送时间')

	class Meta:
		verbose_name = '邮箱验证码'
		verbose_name_plural = verbose_name

class UserProfile(models.Model):
	authstatue = models.SmallIntegerField(default=0,choices=((0,'未实名认证'),(1,'实名认证中'),(2,'已实名认证')))
	usertype = models.BooleanField(default=0,choices=((0,'个人'),(1,'企业')),verbose_name='用户类型')
	realname = models.CharField(max_length=255,verbose_name='真实姓名')

	class Meta:
		verbose_name = '用户信息表'
		verbose_name_plural = verbose_name

class Passport(models.Model):
	'''用户模型类'''
	username = models.CharField(max_length=20,verbose_name="用户名")
	password = models.CharField(max_length=40,verbose_name="密码")
	email = models.EmailField(verbose_name="邮箱")
	is_staff = models.BooleanField(default=0,verbose_name='用户类型')


#用户表的管理器
	# objects = PassportManager()

	class Meta:
		db_table = 's_user_account'



class Banner(models.Model):
	title = models.CharField(max_length=100, verbose_name="轮播图")
	image = models.ImageField(upload_to='banner/%Y/%m',max_length=100,
							  verbose_name='商品图片')

	url = models.URLField(verbose_name="访问地址")
	class Meta:
		verbose_name = "轮播图"
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.title

class UserFlower(models.Model):
	user = models.ForeignKey(UserProfile,verbose_name='关注的人')
	company = models.ForeignKey(Company,verbose_name="关注的公司")
	add_time = models.DateField(verbose_name="关注的时间",default=datetime.now)

	class Meta:
		verbose_name = '关注'
		verbose_name_plural = verbose_name









