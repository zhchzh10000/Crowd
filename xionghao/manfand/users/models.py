from django.db import models
from db.basemodel import BaseModels
from .addhash import get_hash
# Create your models here.
class UserMsg(BaseModels):
    name = models.CharField(max_length=30,unique=True,verbose_name='姓名')
    password = models.CharField(max_length=40, verbose_name='用户密码')
    email = models.EmailField(verbose_name='用户邮箱')
    option = models.SmallIntegerField(default=0, choices=((0,'企业',),(1,'个人',)), verbose_name='用户类型')
    is_active = models.BooleanField(default=False, verbose_name='激活状态')
    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def check_password(self,password):
        password = get_hash(password)
        bool = UserMsg.objects.filter(password=password)
        return bool

    def __str__(self):
        return self.name

class EmailVerifyRecord(BaseModels):
    code = models.CharField(max_length=20,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮件')
    send_type = models.CharField(max_length=30,verbose_name='验证码类型')

    class Meta:
        verbose_name = "验证码"
        verbose_name_plural = verbose_name
