from datetime import datetime

from django.contrib.auth.models import AbstractUser

from django.db import models
class UserProfile(AbstractUser):
    authstatus = models.SmallIntegerField(default=0, choices=((0, '未实名认证'), (1, '实名认证申请中'), (2, '已实名认证')),
										  verbose_name='用户状态', null=False)
    usertype = models.BooleanField(default=0, choices=((0, '个人'), (1, '企业')), verbose_name='用户类型', null=False)
    realname = models.CharField(max_length=255, verbose_name='真实姓名')

    class Meta:
        verbose_name = '用户信息表'
        verbose_name_plural = verbose_name

class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    # url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name

    # 重载__str__方法使后台不再直接显示object
    def __str__(self):
        return '{0}(位于第{1}位)'.format(self.title, self.index)
class EmailVerifyRecord(models.Model):
    # 验证码
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    # 包含注册验证和找回验证
    send_type = models.CharField(verbose_name=u"验证码类型", max_length=10, choices=(("register",u"注册"), ("forget",u"找回密码")))
    send_time = models.DateTimeField(verbose_name=u"发送时间", default=datetime.now)
    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name
    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email)


