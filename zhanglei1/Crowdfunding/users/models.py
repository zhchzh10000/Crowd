from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser
from datetime import datetime
from project.models import Company,Project

#用户信息
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=20,verbose_name='用户名')
    birthday = models.DateField(verbose_name='出生日期', null=True, blank=True)
    gender = models.CharField(max_length=10, choices=(('male', '男'), ('fale', '女')), default='fale')
    address = models.CharField(max_length=100, verbose_name="地址")
    mobbie = models.CharField(max_length=11, null=True, blank=True)
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=50)
    type = models.CharField(choices=(('member','会员'),('user','管理')),default='user',max_length=5)

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

#邮箱验证码
class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    send_type = models.CharField(verbose_name='验证码类型',choices=(('register','注册'),('forget','找回密码'),('update_email','修改邮箱')),max_length=30)
    send_time = models.DateTimeField(verbose_name='发送时间',default=datetime.now)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code,self.email)


#轮播图
class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name="标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name="轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name="访问地址")
    index = models.IntegerField(default=100, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name


#类型
class Type(models.Model):
    company = models.ForeignKey(Company,on_delete=models.CASCADE,null=True)
    image = models.ImageField(upload_to='type/%Y/%m', default='type/default.png', max_length=100)
    name = models.CharField(max_length=100,verbose_name='类型名')
    remark = models.CharField(max_length=100,verbose_name='评论')

    class Meta:
        verbose_name = "分类"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
