from django.db import models
from datetime import datetime
from utils.get_hash import get_hash
# from django.contrib.auth.models import AbstractUser


class MemberManager(models.Manager):
    def add_one_member(self,username,password,email,user_type):
        passport = self.create(username=username,password=get_hash(password),email=email,user_type=user_type)
        return passport

    def get_one_member(self,username,password):
        try:
            passport = self.get(username=username,password=get_hash(password))
        except self.model.DoesNotExist:
            passport = None
        return passport


class MemberProfile(models.Model):
    username = models.CharField(max_length=32,verbose_name='用户名')
    password = models.CharField(max_length=255,verbose_name='密码')
    email = models.EmailField(verbose_name='邮箱')
    user_type = models.IntegerField(default=0, choices=((0, '个人'), (1, '企业')), verbose_name='账户类型')
    create_time = models.DateTimeField(default=datetime.now, verbose_name='创建时间')

    objects = MemberManager()

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'members'
        verbose_name = '会员信息'
        verbose_name_plural = verbose_name


# 实名认证账户类型
class AccountType(models.Model):
    type = models.IntegerField(default=0,choices=((0, '企业'), (1, '个体'), (2, '个人'), (3, '政府')),verbose_name='认证账户类型')
    member = models.OneToOneField(MemberProfile,verbose_name='所属会员')

    class Meta:
        db_table = 'account_type'
        verbose_name = '实名账户类型'
        verbose_name_plural = verbose_name


# 实名身份信息
class RealNameInfo(models.Model):
    real_name = models.CharField(max_length=20,verbose_name='真实姓名')
    id_card = models.CharField(max_length=18,verbose_name='身份证号码')
    phone_num = models.CharField(max_length=13,verbose_name='电话号码')
    member = models.OneToOneField(MemberProfile,verbose_name='所属会员')

    class Meta:
        db_table = 'real_name_info'
        verbose_name = '实名身份信息'
        verbose_name_plural = verbose_name


# 照片认证信息
class IDPicture(models.Model):
    pic = models.ImageField(upload_to='user/id_picture',verbose_name='手持身份证照片')
    member = models.OneToOneField(MemberProfile,verbose_name='所属会员')

    def __str__(self):
        return self.pic.name

    class Meta:
        db_table = 'id_picture'
        verbose_name = '手持身份证照片'
        verbose_name_plural = verbose_name


# 邮箱验证码
class EmailVerifyRecord(models.Model):
    email = models.EmailField(max_length=50, verbose_name="用户邮箱")
    code = models.CharField(max_length=10, verbose_name="验证码")
    verify_type = models.CharField(max_length=30,choices=(("authenticate", "实名认证"), ("forget", "忘记密码"), ("register", "注册激活")),verbose_name="验证类型")
    send_time = models.DateTimeField(default=datetime.now, verbose_name="发送时间")

    def __str__(self):
        return '{0}({1})'.format(self.code,self.email)

    class Meta:
        db_table = 'email_vc'
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name


class NameCertification(models.Model):
    # 它与声明了 unique=True 的 ForeignKey 非常相似，不同的是使用反向关联的时候，得到的不是一个对象列表，而是一个单独的对象
    member = models.OneToOneField(MemberProfile,verbose_name='')


class MemberAddress(models.Model):
    member = models.ForeignKey(MemberProfile,verbose_name='会员')
    address = models.CharField(max_length=255,verbose_name='地址')

    class Meta:
        db_table = 'member_address'
        verbose_name = '会员地址'
        verbose_name_plural = verbose_name


class MemberFollowProject(models.Model):
    project = models.ForeignKey('project.Project',verbose_name='支持项目')
    member = models.ForeignKey(MemberProfile,verbose_name='支持者')

    class Meta:
        db_table = 'member_follow_project'
        verbose_name = '支持者与项目关联信息'
        verbose_name_plural = verbose_name
