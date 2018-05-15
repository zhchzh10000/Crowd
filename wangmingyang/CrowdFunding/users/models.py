from django.db import models
from datetime import datetime
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import AbstractUser

from operation.models import AccountTypeCert
from projects.models import Project


class UserProfile(AbstractUser):
    login_acct = models.CharField(max_length=20, verbose_name='登陆地址')
    gender = models.CharField(max_length=6, choices=(("male", u"男"), ("female", "女")), default="female")
    usertype = models.CharField(max_length=20, choices=((0, "个人"), (1, "企业")))
    mobile = models.CharField(max_length=11,verbose_name='联系电话')
    image = models.ImageField(upload_to="image/%Y/%m", max_length=100)

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

class Member(models.Model):
    username = models.ForeignKey(UserProfile,verbose_name='会员名称')
    realname = models.CharField(max_length=20,unique=True, verbose_name='真实姓名')
    cardnum = models.CharField(max_length=20, verbose_name='身份证')
    # email = models.EmailField(verbose_name='用户邮箱')
    authstatus = models.CharField(max_length=1, choices=((0, "未实名认证"), (1, "实名认证申请中"), (2, "已实名认证")),
                                  verbose_name='实名认证状态')
    accttype = models.ForeignKey(AccountTypeCert, verbose_name="账户类型")



    class Meta:
        verbose_name = '会员表'
        verbose_name_plural = verbose_name


'''会员地址'''
class MemberAddress(models.Model):
    member = models.ForeignKey(Member, verbose_name='会员id')
    address = models.CharField(max_length=100, default="")



class MemberCert(models.Model):
    member = models.ForeignKey(Member, verbose_name='会员id')
    # cert = models.ForeignKey(Cert, verbose_name='证书id')
    iconpath = models.ImageField(max_length=200, default='', verbose_name='会员图片')

'''成员项目表'''

class MemberProjectFollow(models.Model):
    member = models.ForeignKey(Member, verbose_name='会员id')
    project = models.ForeignKey(Project, verbose_name='项目id')



class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name="验证码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    send_type = models.CharField(verbose_name="验证类型",
                                 choices=(("register", "注册"), ("forget", "找回密码"), ("update_email", "修改邮箱")),
                                 max_length=30)
    send_time = models.DateTimeField(verbose_name="发送时间", default=datetime.now)

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name="标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name="轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name="访问地址")
    index = models.IntegerField(default=100, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name



