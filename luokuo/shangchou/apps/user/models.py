from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime


# Create your models here.
# from order.models import Order


class UserProfile(AbstractUser):
    role = models.CharField(max_length=20, choices=(("admin", "管理"), ("member", "会员")), default="member")
    customer_type = models.CharField(max_length=20, choices=(("personal", "个人"), ("enterprise", "企业")), default="personal")
    address = models.CharField(max_length=100, default=u"")
    mobile = models.CharField(max_length=11, null=True, blank=True)
    image = models.ImageField(upload_to="image/user/%Y/%m", default=u"image/default.png", max_length=100)
    rel_name = models.CharField(max_length=20,verbose_name='真实姓名')
    rel_number = models.CharField(verbose_name='身份证号', max_length=18)
    rel_image = models.ImageField(upload_to='cert/%Y/%m',verbose_name='认证照片')
    # order = models.ForeignKey(Order,verbose_name='订单')

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


class Cert(models.Model):
    cert_type = models.CharField(default='sygs',choices=(('sygs','商业公司'),('gth','个体工商户'),('grjy','个人经营'),('zf','政府及非盈利组织')),max_length=20)
    cert_company = models.CharField(verbose_name='认证公司',max_length=100)
    cert_pay = models.CharField(verbose_name='认证账号',max_length=20)
    cert_number = models.CharField(verbose_name='认证法人身份证',max_length=18)
    cert_phone = models.CharField(verbose_name='公司电话',max_length=11)
    cert_info = models.CharField(verbose_name='公司简介',max_length=200)

    class Meta:
        verbose_name = "认证"
        verbose_name_plural = verbose_name
