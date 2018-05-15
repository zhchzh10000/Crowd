from django.db import models
from django.contrib.auth.models import AbstractUser,BaseUserManager
from db.get_hash import get_hash
from db.base_model import BaseModels
# Create your models here.


class MemberManager(BaseUserManager):
    def __init__(self):
        super().__init__()

    def add_one_member(self,password,username,email,user_status=0):
        print('11111111111',password,username,email)
        member = Member(password=get_hash(password),username=username,email=email,user_status=user_status)
        member.save()
        return member

    def get_one_member(self,password,username):
        try:
            member = Member.objects.get(password=get_hash(password),username=username)
            return member
        except Exception:
            return None


class StaffUser(AbstractUser,BaseModels):
    login_acct = models.CharField(max_length=255,blank=True,null=True,default='',verbose_name='登录地址')
    phone = models.IntegerField(blank=True,null=True,verbose_name='电话')



    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '员工表'
        verbose_name_plural = verbose_name


class Member(BaseModels):
    login_acct = models.CharField(max_length=255, verbose_name='登录地址')
    password = models.CharField(max_length=140, verbose_name='密码')
    username = models.CharField(max_length=100,verbose_name='用户名')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    user_status = models.SmallIntegerField(default=0,choices=((0,'未实名认证'),(1,'实名认证申请中'),(2,'已实名认证')),verbose_name='实名状态')

    objects = MemberManager()

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '会员表'
        verbose_name_plural = verbose_name
        permissions = (
            ('create_crowd_fund', "发起众筹"),  # 权限字段名称及其解释
        )


class RealName(BaseModels):
    realname = models.CharField(max_length=100,verbose_name='真实姓名')
    cardnum = models.CharField(max_length=20,verbose_name='身份证号')
    phone = models.IntegerField(verbose_name='手机号码')
    serphone = models.IntegerField(verbose_name='客服电话')
    introduce = models.CharField(max_length=300,verbose_name='介绍')
    hand_image = models.ImageField(upload_to='media/user/%Y/%m',max_length=100,verbose_name='头像')
    one_self = models.CharField(max_length=50,verbose_name='自我介绍')
    self_desc = models.CharField(max_length=200,verbose_name='详细自我介绍')
    member = models.ForeignKey(Member,verbose_name='会员')
    user_type = models.CharField(max_length=5,default=0, choices=(('gr', '个人'), ('gs', '公司'), ('gt', '个体'), ('gf','政府')))

    def __str__(self):
        return self.realname

    class Meta:
        verbose_name = '实名认证表'
        verbose_name_plural =verbose_name











