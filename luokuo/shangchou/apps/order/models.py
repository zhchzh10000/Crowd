from django.db import models
from datetime import datetime

# Create your models here.
from user.models import UserProfile


class Order(models.Model):
	createdate = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
	status = models.CharField(max_length=1, blank=True, null=True,verbose_name='支付状态')
	address = models.CharField(max_length=255, blank=True, null=True,verbose_name='地址')
	invoice = models.CharField(max_length=1, blank=True, null=True,verbose_name='发票')
	invoictitle = models.CharField(max_length=255, blank=True, null=True,verbose_name='发票抬头')
	remark = models.CharField(max_length=255, blank=True, null=True,verbose_name='备注')
	class Meta:
		verbose_name = "订单"
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.ordernum