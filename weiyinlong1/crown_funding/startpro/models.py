from django.db import models

# Create your models here.

class Tag(models.Model):
	name = models.CharField(max_length=100,verbose_name='类别名称')


	class Meta:
		verbose_name = '项目类别'
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.name


class Startpro(models.Model):
	# info = models.CharField(choices='',verbose_name="分类信息")
	# label = models.CharField(choices='',verbose_name='标签')
	proname = models.CharField(max_length=20,verbose_name='项目名称')
	introduct = models.CharField(max_length=40,verbose_name='一句话简介')
	money = models.IntegerField(verbose_name='筹款金额')
	day = models.IntegerField(verbose_name='筹资天数')
	photo = models.ImageField(verbose_name='项目图片')
	introduct_myself = models.CharField(max_length=200,verbose_name='自我介绍')
	detail_instroduct_myself = models.CharField(max_length=300,verbose_name='详细自我介绍')
	client_phone = models.IntegerField(verbose_name='客服电话')

	class Meta:
		db_table = 's_startpro'



class people_info(models.Model):
	myself = models.CharField(max_length=40,verbose_name='自我介绍')
	myselfdetail = models.CharField(max_length=160,verbose_name='详细自我介绍')
	phone = models.IntegerField(verbose_name ='手机号')
	cli_phone = models.IntegerField(verbose_name = '电话')
	class Meta:
		db_table = 's_people_info'


class StartStepTwo(models.Model):
	paynum = models.IntegerField(verbose_name='支付金额')
	content = models.CharField(max_length='200',verbose_name='回报内容')
	num = models.IntegerField(verbose_name='回报数量')
	limitbuy = models.IntegerField(default='0',verbose_name='单笔限购')
	stoptime = models.IntegerField(verbose_name='回报时间')
	class Meta:
		db_table = 's_startsteptwo'

class StartStepThree(models.Model):
	code = models.IntegerField(verbose_name='企业账号')
	people_id = models.CharField(max_length=18, verbose_name='身份证号码')
	class Meta:
		db_table = 's_startstepthree'

class StartStepFour(models.Model):
	pass


class Lable(models.Model):
	name = models.CharField(max_length=20,verbose_name='标签名字')
	project = models.ForeignKey(Startpro,verbose_name='项目名称',null=True)

	class Meta:
		verbose_name = '标签'
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.name

# class projects(models.Model):
# 	fenlei = models.CharField(verbose_name='分类')
# 	state =  models.CharField(verbose_name='状态')
# 	paixu = models.CharField(verbose_name='排序')













