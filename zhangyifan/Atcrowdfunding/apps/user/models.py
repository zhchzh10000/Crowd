from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime


# Create your models here.
from projects.models import Project


class UserProfile(AbstractUser):
    role = models.CharField(max_length=20, choices=(("admin", "管理"), ("member", "会员")), default="member")
    customer_type = models.CharField(max_length=20, choices=(("personal", "个人"), ("enterprise", "企业")), default="personal")
    address = models.CharField(max_length=100, default=u"")
    mobile = models.CharField(max_length=11, null=True, blank=True)
    image = models.ImageField(upload_to="image/user/%Y/%m", default=u"image/default.png", max_length=100)

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


#邮箱
class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    send_type = models.CharField(verbose_name=u"验证码类型",
                                 choices=(("register", u"注册"), ("forget", u"找回密码"), ("update_email", u"修改邮箱")),
                                 max_length=30)
    send_time = models.DateTimeField(verbose_name=u"发送时间", default=datetime.now)

    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)

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



class UserSupprot(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name='支持者')
    project = models.ForeignKey(Project, verbose_name='支持的项目')
    add_time = models.DateField(verbose_name='支持时间', default=datetime.now)

    class Meta:
        verbose_name = '用户支持'
        verbose_name_plural = verbose_name


class UserFlower(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name='关注的人')
    company = models.ForeignKey(Project, verbose_name='关注的公司')
    add_time = models.DateField(verbose_name='关注的时间', default=datetime.now)

    class Meta:
        verbose_name = '用户关注'
        verbose_name_plural = verbose_name


class Address(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name='用户')
    name = models.CharField(max_length=30, verbose_name='收货人', null=True)
    address = models.CharField(max_length=100, verbose_name='收货地址')
    phone = models.BigIntegerField(verbose_name='手机号码')

    class Meta:
        verbose_name = '收货地址'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.address


class UserCreate(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name='创建项目的人')
    project = models.ForeignKey(Project, verbose_name='创建的项目')
    add_time = models.DateField(verbose_name='关注的时间', default=datetime.now)

    class Meta:
        verbose_name_plural = verbose_name = '创建项目表'

    def __str__(self):
        return self.user.username