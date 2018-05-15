from django.db import models
from db.basemodel import BaseModels
# Create your models here.


class OrderInfo(BaseModels):
    send_choice = ((0,'免运费'),(1,'货到付款'),(2,'买家承担'))
    bill_type = ((0, '不开发票'), (1, '开发票'))
    user = models.ForeignKey('users.UserMsg', verbose_name='下单者')
    is_bill = models.SmallIntegerField(default=0, choices=bill_type, verbose_name='是否发票')
    remarksr = models.CharField(max_length=100, verbose_name='备注')
    product = models.ForeignKey('product.ReProduct',verbose_name='回报商品')
    start_company = models.ForeignKey('product.CompanyMsg',verbose_name='发起人')
    com_repay = models.CharField(max_length=200,verbose_name='回报内容')
    num_repay = models.IntegerField(default=1,verbose_name='回报数量')
    price_support = models.IntegerField(default=1,verbose_name='支持单价')
    send_way = models.SmallIntegerField(default=0, choices=send_choice, verbose_name='商品状态')

    class Meta:
        verbose_name = "订单信息"
        verbose_name_plural = verbose_name


class OrderAdress(BaseModels):
    user = models.ForeignKey('users.UserMsg', verbose_name='使用者')
    rev_person = models.CharField(max_length=30, verbose_name='收货人')
    rev_phone = models.CharField(max_length=20, verbose_name='收货人电话')
    rev_adress = models.CharField(max_length=100, verbose_name='收货地址')


    class Meta:
        verbose_name = "订单地址"
        verbose_name_plural = verbose_name


