from datetime import datetime
from django.db import models

from tinymce.models import HTMLField

class Store(models.Model):
	name = models.CharField(max_length=40,verbose_name='名称')
	email = models.EmailField(max_length=20,verbose_name='邮箱')
	authstatus = models.CharField(max_length=20,verbose_name='认证状态')
	usertype = models.BooleanField(max_length=20,verbose_name='用户类型',default=0)
	image = models.ImageField(upload_to='type/%Y/%m',default='type/default.png',max_length=100,verbose_name='商品图片')

	desc = models.CharField(max_length=100,verbose_name='商品简介')
	# price = models.IntegerField(max_digits=10,decimal_places = 2,verbose_name='商品价格')
	sales = models.IntegerField(default=0,verbose_name='商品销量')
	# status = models.SmallIntegerField(default=ONLINE,choices=status_choices,verbose_name='商品状态')

	create_time = models.TimeField(verbose_name='创建时间',max_length=30)
	people_num = models.IntegerField(verbose_name='人数')
	'''模型 管理器'''
	# objects = StoreManager()

	class Meta:
		db_table = 's_store'

class Prodetail(models.Model):
	image = models.ImageField(upload_to='type/%Y/%m', max_length=100,
							  verbose_name='商品图片')
	storename = models.CharField(max_length=20, verbose_name='商品名字')
	desc = models.CharField(max_length=200, verbose_name='商品简介')
	class Meta:
		verbose_name = "项目详情"
		verbose_name_plural = verbose_name

class Imagelist(models.Model):
	image = models.ImageField(upload_to='type/%Y/%m', max_length=100,
							  verbose_name='商品图片')
	names = models.CharField(max_length=40, verbose_name='商品名字')
	sale = models.IntegerField( verbose_name='目标金额')
	progress = models.IntegerField(verbose_name="众筹进度")
	persons = models.IntegerField(verbose_name="支持人数")
	datestop = models.DateTimeField(default=datetime.now, verbose_name="截止时间")

	class Meta:
		verbose_name = "图片列表"
		verbose_name_plural = verbose_name

class Company(models.Model):
	name = models.CharField(max_length=60,verbose_name="公司名称")
	desc = models.CharField(max_length=255,verbose_name="公司简介")
	phone = models.IntegerField(verbose_name='电话')
	image = models.ImageField(upload_to='cpmpany/%Y%m',null=True,verbose_name='公司图片')

	class Meta:
		verbose_name = '公司名称'
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.name

# class fenlei(models.Model):





