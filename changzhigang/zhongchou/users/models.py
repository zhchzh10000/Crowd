from django.db import models

# Create your models here.

class User_Table(models.Model):
	name = models.CharField(max_length='20',verbose_name='帐号',)
	password = models.CharField(max_length=40,verbose_name='密码')
	email = models.EmailField(max_length=20,verbose_name='邮箱')
	choice = models.SmallIntegerField(choices=((1,'企业'),(0,'个人')),default=1)
	Permissions = models.SmallIntegerField(choices=((1, '会员'), (0, '管理')), default=1)
	remember =  models.BooleanField(default=False, verbose_name='记住密码')

	class Meta:
		verbose_name = '注册'
		verbose_name_plural = verbose_name
