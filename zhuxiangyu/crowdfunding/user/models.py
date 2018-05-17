from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime

CERTIFY_TYPE = {
    'BusinessCompany': '商业公司',
    'IndividualIndustryAndCommerce': '个体工商户',
    'PersonalManagement': '个人经营',
    'GovernmentAndNoprofitOrganizations': '政府及非营利组织',
}


'''
用户信息
'''
class UserProfile(AbstractUser):
    usercategory = models.CharField(max_length=10,choices=(('company','企业'),('personal','个人')),verbose_name='用户类别',default='personal')
    
    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.username

'''
用户认证信息
'''
class UserCertify(models.Model):
    certify_type = ((key, value) for key, value in CERTIFY_TYPE.items())
    
    usercertify_type = models.CharField(max_length=100, choices=certify_type, verbose_name='实名认证账户类型')
    realname_certify = models.CharField(max_length=10, default='0',
                                        choices=(('0', '未实名认证'), ('1', '已实名认证')), verbose_name='用户实名认证')
    realname = models.CharField(max_length=50, verbose_name='用户真实姓名',default='')
    id_card = models.CharField(max_length=18, verbose_name='用户身份证号',default=0)
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name='手机号',default='')
    idcard_handler_img = models.ImageField(max_length=100, verbose_name='手持身份证照片', upload_to='idcard_handler_img/%Y/%m',
                                           default='idcard_handler_img/default.png')
    email = models.EmailField(verbose_name='认证邮箱',default='')
    
    user = models.ForeignKey(UserProfile,verbose_name='认证的用户')
    
    class Meta:
        verbose_name = '用户认证信息'
        verbose_name_plural = verbose_name
    
    def __str__(self):
        return '{0}{1}{2}'.format(self.user.username,self.certify_type,self.realname)


# 邮箱验证记录
class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    code_type = models.CharField(max_length=30,verbose_name='验证码类型',
                    choices=(('register','注册'),('forget','找回密码'),('update_email','修改邮箱'),('realname_certify','实名认证')))
    send_time = models.DateTimeField(verbose_name='发送时间',default=datetime.now)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}{1}'.format(self.code,self.email)
    
# 用户收件地址
class UserAddress(models.Model):
    receiver = models.CharField(max_length=50,verbose_name='收件人',default='')
    phone = models.CharField(max_length=11,verbose_name='收件电话',default='')
    address = models.CharField(max_length=200,verbose_name='收货地址',default='')
    user = models.ForeignKey(UserProfile,verbose_name='认证的用户',default=1)

    class Meta:
        verbose_name = '用户收件地址'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}{1}'.format(self.receiver,self.address)