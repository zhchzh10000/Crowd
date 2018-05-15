from django.db import models
from projects.models import *
# Create your models here.
from users.models import *

'''回报模块'''


class Repay(models.Model):
    project = models.ForeignKey(Project, verbose_name='项目id')
    content = models.CharField(max_length=255, verbose_name='回报内容')
    type = models.CharField(max_length=1, choices=((0, "实物回报"), (1, "虚拟物品回报")))
    supportmoney = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='支持单价')
    count = models.CharField(max_length=20, verbose_name='回报数量')
    image = models.ImageField(upload_to='repay', verbose_name='回报图片')
    signalpurchase = models.CharField(max_length=20)
    purchase = models.CharField(max_length=20)
    residue = models.CharField(max_length=10,verbose_name='剩余天数')
    freight = models.IntegerField( verbose_name='运费',default=0,choices=((0,'包邮'),(1,'不包邮')))
    invoice = models.CharField(max_length=1, choices=((0, "不开发票"), (1, "开发票")))
    rtndate = models.DateTimeField(default=datetime.now)

'''证书表'''


class Cert(models.Model):
    name = models.CharField(max_length=100, verbose_name='证书名字')


'''账户类型证书'''


class AccountTypeCert(models.Model):
    accttype = models.IntegerField( default=0,choices=((0, "企业"), (1, "个体"), (2, "个人"), (3, "政府")))
    cert = models.ForeignKey(Cert, verbose_name="证书id")


'''字典表'''


class Dictionary(models.Model):
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=20)
    subcode = models.CharField(max_length=20)
    val = models.CharField(max_length=20)


'''广告表'''


class Advertisement(models.Model):
    name = models.CharField(max_length=20, verbose_name='广告名字')
    iconpath = models.ImageField(max_length=100, default='', verbose_name='广告logo')
    status = models.CharField(max_length=1, choices=((0, "草稿"), (1, "未审核"), (2, "审核完成"), (3, "发布")),
                              verbose_name='广告审核状态')

'''消息模板'''


# class Message(models.Model):
#     member = models.ForeignKey(Member, verbose_name='会员id')
#     content = models.CharField(max_length=255, verbose_name='消息内容')
#     send_date = models.DateTimeField(verbose_name="发送时间", default=datetime.now)


'''订单模块'''

# class Order(models.Model):
#     member = models.ForeignKey(Member, verbose_name='会员id')
#     project = models.ForeignKey(Project, verbose_name='项目id')
#     repay = models.ForeignKey(Repay)
#     ordernum = models.CharField(max_length=20)
#     money = models.DecimalField(max_digits=10, decimal_places=2)
#     rtncount = models.IntegerField(max_length=20)
#     status = models.CharField(max_length=1, choices=((0, "待付款"), (1, "交易完成"), (2, "交易关闭")))
#     address = models.CharField(max_length=100)
#     invoice = models.CharField(max_length=1, choices=((0, "不开发票"), (1, "开发票")))
#     invoictitle = models.CharField(max_length=200)
#     remark = models.CharField(max_length=200)
#     createdate = models.DateTimeField(verbose_name="发送时间", default=datetime.now)
#
