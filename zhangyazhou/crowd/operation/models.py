from django.db import models

from db.base_model import BaseModels
from users.models import Member
# Create your models here.


class VerificationCode(BaseModels):
    member = models.ForeignKey(Member,verbose_name='会员')
    code = models.CharField(max_length=24,verbose_name='验证码')
    code_type = models.CharField(max_length=10,choices=(('zc','注册'),('smrz','实名认证'),('xgmm','修改密码')),verbose_name='验证码类型')

    def __str__(self):
        return "%s|%s|%s" % (self.member_id,self.code,self.type)

    class Meta:
        verbose_name = '验证码表'