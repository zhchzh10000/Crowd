# coding: utf-8
from django.db import models
from db.basemodel import BaseModels
import datetime
import time

# Create your models here.


class ProductMsg(BaseModels):
    type_choice = ((0, '科技'), (1, '设计'), (2, '公益'), (3, '农业'), (4, '文化'))
    mode_choice = ((0, '即将众筹'), (1, '正在众筹'), (2, '众筹完成'))

    name = models.CharField(max_length=50, verbose_name=u'商品名称')
    desc = models.CharField(max_length=100, verbose_name='商品介绍')
    pro_sales = models.IntegerField(default=0, verbose_name='商品销量')
    type = models.SmallIntegerField(default=0, choices=type_choice, verbose_name='商品类型')
    mode = models.SmallIntegerField(default=0, choices=mode_choice, verbose_name='商品状态')
    price = models.DecimalField(default=0, max_digits=10, decimal_places=2, verbose_name='商品价格')
    prcie_back = models.DecimalField(default=0, max_digits=10, decimal_places=2, null=True, verbose_name='原始价格')
    target_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='目标金额')
    reach_price = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='达成金额')
    one_num = models.IntegerField(default=0, null=True, verbose_name='一元人数')
    support_num = models.IntegerField(default=0, verbose_name='达成人数')
    target_num = models.IntegerField(default=200, verbose_name='目标人数')
    fin_day = models.IntegerField(default=10, verbose_name='达成天数')
    company = models.ForeignKey('CompanyMsg', verbose_name=u'公司名称', null=True, blank=True)
    follow = models.IntegerField(default=0, verbose_name='关注人数')
    tag = models.CharField(max_length=60, verbose_name='标签')
    image = models.ImageField(upload_to='books', verbose_name='商品头图')
    image_dec = models.ImageField(upload_to='books', verbose_name='商品详图')

    def get_day(self):
        etime = str(self.add_time).split('+')[0]
        etime2 = str(datetime.datetime.now()).split('.')[0]
        date1 = time.strptime(etime, "%Y-%m-%d %H:%M:%S")
        date2 = time.strptime(etime2, "%Y-%m-%d %H:%M:%S")
        date1 = datetime.datetime(date1[0], date1[1], date1[2])
        date2 = datetime.datetime(date2[0], date2[1], date2[2])
        day = (date2 - date1).days
        if self.fin_day - day >0:
            return self.fin_day - day
        else:
            return 0

    def get_cal_image(self):
        cal_product = ProductMsg.objects.all().order_by('-pro_sales')[:2]
        return cal_product

    def get_uptime(self):
        new_product = ProductMsg.objects.all().order_by('-add_time')[:3]
        return new_product

    def get_list(self):
        pro = ProductMsg.objects.all().order_by('add_time')[:4]
        return pro

    def get_remain(self):
        return self.target_num - self.support_num

    class Meta:
        verbose_name = "商品信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class ReProduct(BaseModels):
    type_choice = ((0, '实物回报'), (1, '虚拟物品回报'))
    num_choice = ((0, '限购'), (1, '不限购'))
    bill_type = ((0, '不开发票'), (1, '开发票'))
    product = models.ForeignKey('ProductMsg', verbose_name='商品')
    supper_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='支持金额')
    retype = models.SmallIntegerField(default=0, choices=type_choice, verbose_name='回报类型')
    recon = models.CharField(max_length=300, verbose_name='回报内容')
    explainImage = models.ImageField(upload_to='books', verbose_name='说明图片')
    re_num = models.IntegerField(default=0, verbose_name='回报数量')
    num_type = models.IntegerField(default=0, verbose_name='限购类型')
    buy_num = models.IntegerField(default=1, verbose_name='限购数量')
    fare_price = models.DecimalField(max_digits=10, default=0, decimal_places=2, verbose_name='运费')
    is_bill = models.SmallIntegerField(default=0, choices=bill_type, verbose_name='是否发票')
    re_day = models.IntegerField(default=10, verbose_name='达成天数')

    def get_fare(self):
        if self.fare_price==0:
            return '免运费'
        return self.fare_price

    class Meta:
        verbose_name = "回报信息"
        verbose_name_plural = verbose_name


class CompanyMsg(BaseModels):
    name = models.CharField(max_length=50, verbose_name=u'公司名称')
    desc = models.CharField(max_length=100, verbose_name='公司简介')
    phone = models.CharField(max_length=20, verbose_name='公司电话')

    class Meta:
        verbose_name = "公司信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class ProFollow(BaseModels):
    user = models.ForeignKey('users.UserMsg', verbose_name=u"用户")
    fav_id = models.IntegerField(default=0, verbose_name=u"商品id")
    def get_pro(self):
        product =  ProductMsg.objects.get(id=self.fav_id)
        return product


class EasyPay(BaseModels):
    accountion = models.IntegerField(null=False, verbose_name='易付宝账号')
    card = models.CharField(max_length=30, verbose_name='法人身份证号码')
    usermsg = models.ForeignKey('users.UserMsg', verbose_name='用户')
