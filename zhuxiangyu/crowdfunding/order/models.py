from django.db import models
from user.models import UserAddress,UserProfile
from project.models import RepayInfo
from datetime import datetime


'''
回报订单信息
'''
class OrderInfo(models.Model):
    # 外键都关联user会混乱？？？？？？？需要先创建地址表
    address = models.ForeignKey(UserAddress,verbose_name='订单的收货地址',default=1)
    
    repayinfo = models.ForeignKey(RepayInfo,verbose_name='订单的购买回报信息',default='')
    user = models.ForeignKey(UserProfile,verbose_name='订单用户')

    order_id = models.CharField(max_length=64, primary_key=True, verbose_name='订单编号')
    need_receipt = models.CharField(max_length=10,choices=(('0','无需发票'),('1','需要发票')),verbose_name='是否开发票',default='0')
    receipt_head = models.CharField(max_length=100,verbose_name='发票抬头',default='')
    remarks = models.CharField(max_length=300,verbose_name='订单备注',default='')
    createtime = models.DateTimeField(verbose_name='创建时间',default=datetime.now)
    repay_count = models.IntegerField(verbose_name='购买数量',default=1)
    freight = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='运费',default=0)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='支持总价',default=0)
    discount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='优惠价格',default=0)
    pay_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='支付价格',default=0)
    order_status = models.CharField(max_length=10,verbose_name='订单状态',default='1',
                                    choices=((('1', "待支付"),('2', "待发货"),('3', "待收货"),('4', "待评价"),('5', "已完成"),)))
    
    class Meta:
        verbose_name = '回报订单信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}{1}'.format(self.order_id,self.user.username)
    
    

    