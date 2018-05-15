from django.db import models
from datetime import datetime
# Create your models here.

class Project(models.Model):
	category = models.CharField(verbose_name='产品分类',max_length=20,default='st',choices=(('st','科技'),('design','设计'),('pw','公益'),('ag','农业'),('cu','文化')))
	image = models.ImageField(upload_to="image/project/%Y/%m",null=True,max_length=100)
	image_detail = models.ImageField(upload_to="image/project/%Y/%m",null=True, max_length=100)
	name = models.CharField(max_length=255,verbose_name='项目名称')
	remark = models.CharField(max_length=255,verbose_name='标签')
	money = models.BigIntegerField(verbose_name='目标金额')
	day = models.CharField(max_length=10,verbose_name='筹集天数')
	status = models.CharField(max_length=20,default='ready',choices=(('ready','即将开始'),('begin','众筹中'),('success','众筹成功'),('fail','众筹失败')),verbose_name='当前状态')
	deploydate = models.DateField(default=datetime.now, verbose_name='部署时间')
	supporter = models.IntegerField(verbose_name='支持人数')
	supportmoney = models.BigIntegerField(verbose_name='支持金额')
	completion = models.IntegerField(verbose_name='完成进度')
	memberid = models.IntegerField(verbose_name='会员数')
	createdate = models.DateField(default=datetime.now,verbose_name='创建时间')
	follower = models.IntegerField(verbose_name='众筹人数')
	info = models.CharField(verbose_name='一句话简介',max_length=100)



	class Meta:
		verbose_name = "项目信息"
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.name