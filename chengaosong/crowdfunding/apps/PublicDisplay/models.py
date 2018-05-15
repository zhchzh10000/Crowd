from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser
# Create your models here.


# '''后台用户表'''
# class UserInfo(AbstractUser):
# 	nick_name = models.CharField(verbose_name='登录名称',max_length=255)
#
# 	user_type = models.CharField(verbose_name='账户类型',choices=(('0','企业'),('1','个人')))
#
# 	class Meta:
# 		verbose_name = '用户表'
# 		verbose_name_plural = verbose_name
#
# 	def __str__(self):
# 		return self.username

'''会员表'''
class Member(AbstractUser):
	nick_name = models.CharField(max_length=255,verbose_name='登录名',blank=True,null=True)
	user_type = models.CharField(max_length=12,choices=(('0','企业'),('1','个人')))
	authstatus = models.CharField(choices=(('0','未认证'),('1','实名认证申请中'),('2','已实名认证')),verbose_name='实名认证状态',max_length=1,default=0)
	real_name = models.CharField(max_length=255,verbose_name='真实名称',blank=True,null=True)
	cardnum = models.CharField(max_length=255,verbose_name='身份证号',blank=True,null=True)
	accttye = models.CharField(max_length=1,choices=(('0','企业'),('1','个体'),('2','个人'),('3','政府')),verbose_name='账目类型',default=2)

	class Meta:
		verbose_name = '会员表'
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.username




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
	def get_object(self):
		return self.project_set.all()

'''众筹项目'''
class Project(models.Model):
	type = models.ForeignKey(Type,verbose_name='分类')
	name = models.CharField(max_length=255,verbose_name='项目名称')
	tag = models.ManyToManyField(Twolable, verbose_name='标签')
	remark = models.CharField(max_length=255,verbose_name='简介')
	money = models.BigIntegerField(verbose_name='筹资金额（元）')
	day = models.IntegerField(verbose_name='筹资天数(天)')
	status = models.CharField(choices=(('0','即将开始'),('1','众筹中'),('2','众筹成功'),('3','众筹失败')),verbose_name='众筹状态',max_length=20,default='0')
	deploydate = models.DateTimeField(verbose_name='部署日期',default=datetime.now)
	supportmoney = models.BigIntegerField(verbose_name='支持资金',default=0)
	completion = models.CharField(choices=(('0','未完成'),('1','已完成')),verbose_name='是否完成',default='0',max_length=1)
	memberid = models.ForeignKey(Member,verbose_name='发起者')
	createdate = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
	project_head_img = models.ImageField(upload_to='head_img/%Y/%m',verbose_name='项目头图')
	project_detail = models.ImageField(upload_to='detail/%Y/%m',verbose_name='项目详情')
	Follower_nums = models.IntegerField(verbose_name='关注数',default=0)
	support_nums = models.IntegerField(verbose_name='支持数',default=0)

	show = models.CharField(max_length=255,verbose_name='自我介绍',blank=True,null=True)
	detail_show = models.TextField(verbose_name='详细自我介绍',blank=True,null=True)
	phone = models.CharField(max_length=11,verbose_name='联系电话',blank=True,null=True)
	service_phone = models.CharField(max_length=11,verbose_name='客服电话',blank=True,null=True)

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

	purchase = models.IntegerField(verbose_name='单笔限购',default=0)
	freight = models.IntegerField(verbose_name='货运')
	invoice = models.CharField(choices=(('0','不开发票'),('1','开发票')),verbose_name='发票',max_length=1)
	rtndate = models.CharField(verbose_name='回报时间',max_length=11)
	class Meta:
		verbose_name = '回报表'
		verbose_name_plural = verbose_name
	def get_support_num(self):
		return self.support_set.count()

'''关注表'''
class Follower(models.Model):
	memberid = models.ForeignKey(Member,verbose_name='会员')
	projectid = models.ForeignKey(Project,verbose_name='项目')
	class Meta:
		verbose_name = '关注表'
		verbose_name_plural = verbose_name
#支持表
class Support(models.Model):

	member = models.ForeignKey(Member,verbose_name='会员')
	project = models.ForeignKey(Project,verbose_name='项目')
	returns = models.ForeignKey(Return,verbose_name='支持类型')




'''订单表'''
class Order(models.Model):


	order_id = models.CharField(max_length=255,verbose_name='订单号')
	memberid = models.ForeignKey(Member,verbose_name='会员id')
	projectid = models.ForeignKey(Project,max_length=11,verbose_name='项目id')
	returnid = models.ForeignKey(Return,max_length=11,verbose_name='回报id')
	order_num = models.CharField(max_length=255,verbose_name='订单数量',default='')
	create_date = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
	money = models.IntegerField(verbose_name='价格')
	rtncount = models.IntegerField(verbose_name='返回数量')
	status = models.CharField(choices=(('0','待付款'),('1','交易完成'),('9','交易关闭')),verbose_name='状态',max_length=1,default=0)
	address = models.CharField(max_length=255,verbose_name='地址',default='')
	invoice = models.CharField(max_length=1,choices=(('0','不开发票'),('1','开发票')),verbose_name='发票',default=0)
	invoictitle = models.CharField(max_length=255,verbose_name='发票抬头',default='')
	remark = models.CharField(max_length=255,verbose_name='备注',default='')
	class Meta:
		verbose_name = '订单'
		verbose_name_plural = verbose_name



'''会员地址表'''
class MemberAddress(models.Model):
	memberid = models.ForeignKey(Member,max_length=11,verbose_name='会员id')
	name=models.CharField(max_length=255,verbose_name='收件人')
	phone=models.CharField(max_length=255,verbose_name='电话')
	address = models.CharField(max_length=255,verbose_name='地址')
	class Meta:
		verbose_name = '会员地址表'
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

# Banner图

class Banner(models.Model):
	title = models.CharField(max_length=100, verbose_name=u"标题")
	image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
	url = models.URLField(max_length=200, verbose_name=u"访问地址")
	index = models.IntegerField(default=100, verbose_name=u"顺序")
	add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

	class Meta:
		verbose_name = u"轮播图"
		verbose_name_plural = verbose_name



























		#
#
# '''信息'''
# class Message(models.Model):
# 	memberid = models.ForeignKey(Member,max_length=11,verbose_name='会员')
# 	content = models.CharField(max_length=255,verbose_name='内容')
# 	senddate = models.CharField(max_length=19,verbose_name='发送数据')
# 	class Meta:
# 		verbose_name = '信息表'
# 		verbose_name_plural = verbose_name
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# '''广告'''
# class Advertisement(models.Model):
# 	name = models.CharField(max_length=255,verbose_name='广告名')
# 	iconpath = models.CharField(max_length=255,verbose_name='图标路径')
# 	status = models.CharField(max_length=1,choices=(('0','草稿'),('1','未审核'),('2','审核完毕'),('3','发布')),verbose_name='状态')
# 	url = models.URLField(max_length=255,verbose_name='url')
# 	userid = models.ForeignKey(User,verbose_name='用户')
# 	class Meta:
# 		verbose_name = '广告'
# 		verbose_name_plural = verbose_name
#
#
#
# '''证书表'''
# class Cert(models.Model):
# 	name = models.CharField(max_length=255,verbose_name='证书名称')
# 	class Meta:
# 		verbose_name = '证书'
# 		verbose_name_plural = verbose_name
#
# '''账目类型-证书'''
# class AccTypeCert(models.Model):
# 	accttype = models.ForeignKey(Member,max_length=1,verbose_name='账目类型')
# 	certid = models.ForeignKey(Cert,max_length=11,verbose_name='证书')
# 	class Meta:
# 		verbose_name = '账目类型-证书'
# 		verbose_name_plural = verbose_name
#
#
#
#
# class param(models.Model):
# 	name = models.CharField(max_length=255,verbose_name='名字')
# 	code = models.CharField(max_length=255,verbose_name='码')
# 	val = models.CharField(max_length=255,verbose_name='值')
#
#
#
#
#
#
#
#
#

#
#
#
#
#
# '''角色表'''
# class Role(models.Model):
# 	name = models.CharField(max_length=255,verbose_name='名称')
# 	class Meta:
# 		verbose_name = '角色'
# 		verbose_name_plural = verbose_name
#
#
# '''认证表'''
# class Permission(models.Model):
# 	pid = models.IntegerField(verbose_name='pid')
# 	name = models.CharField(max_length=255,verbose_name='名称')
# 	icon = models.ImageField(upload_to='image/%Y/%m',verbose_name='图标',max_length=255)
# 	url = models.CharField(max_length=255,verbose_name='url')
# 	class Meta:
# 		verbose_name = '认证表'
# 		verbose_name_plural = verbose_name
#
# '''用户-角色表'''
# class UserRole(models.Model):
# 	userid = models.ForeignKey(User,verbose_name='用户')
# 	roleid = models.ForeignKey(Role,verbose_name='角色')
# 	class Meta:
# 		verbose_name = '用户-角色关系表'
# 		verbose_name_plural = verbose_name
#
#
# '''角色-认证'''
# class RolePermission(models.Model):
# 	roleid = models.ForeignKey(Role,verbose_name='角色')
# 	permissionid = models.ForeignKey(Permission,verbose_name='认证')
# 	class Meta:
# 		verbose_name = '角色-认证关系表'
# 		verbose_name_plural = verbose_name
#
#
#
#
#
#
# class Ticket(models.Model):
# 	memberid  = models.ForeignKey(Enterprise,verbose_name='会员')
# 	piid = models.CharField(max_length=64,verbose_name='订单编号')
# 	status = models.CharField(choices=(('0','审核中'),('1','审核完毕')),verbose_name='状态',max_length=1)
# 	authcode = models.CharField(max_length=4,verbose_name='状态码')
# 	pstep = models.CharField(max_length=255,choices=(('accttype','账户类型'),('basicinfo','基本信息'),('uploadfile','资质文件上传'),('checkemail','邮箱确认')),)
#
