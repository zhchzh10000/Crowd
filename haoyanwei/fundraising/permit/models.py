from django.db import models
from datetime import datetime
# Create your models here.
from users.models import  User



'''标签'''
class Tag(models.Model):
	name = models.CharField(max_length=255,verbose_name='标签类型')
	class Meta:
		verbose_name = '标签'
		verbose_name_plural = verbose_name
	def __str__(self):
		return self.name


class Twolable(models.Model):
	tag = models.ForeignKey(Tag,verbose_name='标签表')
	name = models.CharField(max_length=255,verbose_name='二级标签')
	class Meta:
		verbose_name = '二级标签'
		verbose_name_plural = verbose_name
	def __str__(self):
		return self.name



'''类别表'''
class Type(models.Model):
	name = models.CharField(max_length=255,verbose_name='名称')
	remark = models.CharField(max_length=255,verbose_name='描述')
	class Meta:
		verbose_name = '类别表'
		verbose_name_plural = verbose_name
	def __str__(self):
		return self.name


'''众筹项目'''
class Project(models.Model):
	type = models.ForeignKey(Type,verbose_name='分类')
	name = models.CharField(max_length=255,verbose_name='项目名称')
	tag = models.ManyToManyField(Twolable, verbose_name='标签')
	remark = models.CharField(max_length=255,verbose_name='简介')
	money = models.BigIntegerField(verbose_name='筹资金额（元）')
	day = models.IntegerField(verbose_name='筹资天数(天)')
	status = models.CharField(choices=(('0','即将开始'),('1','众筹中'),('2','众筹成功'),('3','众筹失败')),verbose_name='众筹状态',max_length=20,default='0')
	deploydate = models.DateTimeField(max_length=10,verbose_name='部署日期',default=datetime.now)
	supportmoney = models.BigIntegerField(verbose_name='支持资金',default=0)
	completion = models.CharField(choices=(('0','未完成'),('1','已完成')),verbose_name='是否完成',default='0',max_length=1)
	memberid = models.ForeignKey(User,verbose_name='发起者')
	createdate = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
	project_head_img = models.ImageField(upload_to='head_img/%Y/%m',verbose_name='项目头图')
	project_detail = models.ImageField(upload_to='detail/%Y/%m',verbose_name='项目详情')
	class Meta:
		verbose_name = '众筹项目'
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.name



'''回报表'''
class Return(models.Model):
	projectid = models.ForeignKey(Project,max_length=11,verbose_name='项目')
	type = models.CharField(max_length=1,choices=(('0','实物回报'),('1','虚拟物品回报')),verbose_name='回报类型')
	supportmoney = models.IntegerField(verbose_name='支持资金')
	content = models.CharField(max_length=255,verbose_name='回报内容')
	explain = models.ImageField(max_length=255,upload_to='explain/%Y/%m',verbose_name='说明图片')
	count = models.IntegerField(verbose_name='回报数量')
	purchase = models.IntegerField(verbose_name='单笔限购',default=1,)
	freight = models.IntegerField(verbose_name='货运')
	invoice = models.CharField(choices=(('0','不开发票'),('1','开发票')),verbose_name='发票',max_length=1)
	rtndate = models.DateTimeField(verbose_name='回报时间')
	class Meta:
		verbose_name = '回报表'
		verbose_name_plural = verbose_name


'''订单表'''
class Order(models.Model):
	memberid = models.ForeignKey(User,verbose_name='会员id')
	projectid = models.ForeignKey(Project,max_length=11,verbose_name='项目id')
	returnid = models.ForeignKey(Return,max_length=11,verbose_name='回报id')
	order_num = models.CharField(max_length=255,verbose_name='订单数量')
	create_date = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
	money = models.IntegerField(verbose_name='价格')
	rtncount = models.IntegerField(verbose_name='返回数量')
	status = models.CharField(choices=(('0','待付款'),('1','交易完成'),('9','交易关闭')),verbose_name='状态',max_length=1)
	address = models.CharField(max_length=255,verbose_name='地址')
	invoice = models.CharField(max_length=1,choices=(('0','不开发票'),('1','开发票')),verbose_name='发票')
	invoictitle = models.CharField(max_length=255,verbose_name='发票抬头')
	remark = models.CharField(max_length=255,verbose_name='备注')
	class Meta:
		verbose_name = '订单'
		verbose_name_plural = verbose_name


'''支持表'''
class Follower(models.Model):
	memberid = models.ForeignKey(User,verbose_name='会员')
	projectid = models.ForeignKey(Project,verbose_name='项目')
	class Meta:
		verbose_name = '支持-项目表'
		verbose_name_plural = verbose_name



