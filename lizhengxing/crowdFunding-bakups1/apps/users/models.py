from django.db import models
from django.contrib.auth.models import AbstractUser
from project.models import Project

# 普通用户
class UserProfile(AbstractUser):
    name = models.CharField(max_length=50, null=True, blank=True, verbose_name=u'真实姓名')

    image = models.ImageField(upload_to="image/%Y/%m",  verbose_name=u'头像')
    user_type = models.CharField(verbose_name=u"用户类型",
                                 choices=(("0", u"个人"), ("1", u"企业")), max_length=30)

    loginacct = models.CharField(max_length=255, null=True, blank=True, verbose_name='登录地址')
    authstatu = models.CharField(max_length=1, choices=(('0', '未实名认证'),
                                                       ('1', '实名认证申请中'),
                                                       ('2', '已实名认证')), verbose_name='实名认证状态')
    accttypes = models.CharField(max_length=1, choices=(('0', '企业'),
                                                       ('1', '个体'),
                                                       ('2', '个人'),
                                                       ('3', '政府')), verbose_name='企业类型')
    project = models.ForeignKey(Project,  null=True, blank=True, verbose_name='项目')
    base_id = models.IntegerField(default=0, verbose_name='翼支付账号')
    user_id = models.IntegerField(default=0, verbose_name='身份证号')




    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

#广告
class Advertisement(models.Model):
    name = models.CharField(max_length=2000, verbose_name='广告名')
    icon = models.ImageField(default='', upload_to="image/%Y/%m", verbose_name=u'图片')
    status = models.CharField(max_length=1, choices=(('0', '草稿，'),
                                                        ('1', '未审核，'),
                                                        ('2', '审核完成，'),
                                                        ('3', '发布')), verbose_name='企业类型')
    url = models.CharField(max_length=2000, verbose_name='链接地址')
    pid = models.ForeignKey(Project, verbose_name='项目')
    user = models.ForeignKey(UserProfile, verbose_name='发起人')
    created = models.DateTimeField(auto_now_add=True)
    class Meta:
        verbose_name = u"项目广告"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name





