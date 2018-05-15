from django.db import models

# Create your models here.
from user.models import UserProfile


class ReturnSetting(models.Model):
	r_user = models.ForeignKey(UserProfile,verbose_name='发起者')
	r_num = models.AutoField(primary_key=True,verbose_name='序号')
	r_type = models.CharField(choices=(('entity','实物回报'),('virtual','虚拟物品回报')),max_length=10,verbose_name='回报类型')
	support_money = models.CommaSeparatedIntegerField(verbose_name='支持金额',max_length=10)
	r_content = models.CharField(verbose_name='回报内容',max_length=200)
	r_image = models.ImageField(upload_to='image/project/%Y/%m',max_length=100,verbose_name='回报图片说明')
	r_total = models.CharField(verbose_name='回报数量',max_length=10)
	r_limit = models.CharField(verbose_name='限购',choices=(('no','不限购'),('yes','限购')),default='no',max_length=10)
	r_freight = models.CommaSeparatedIntegerField(verbose_name='运费',max_length=10)
	r_invoice = models.CharField(verbose_name='发票',choices=(('no','不开发票'),('yes','可开发票')),default='no',max_length=10)
	r_date = models.CharField(verbose_name='回报时间',max_length=10)
	class Meta:
		verbose_name = "回报设置"
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.r_num


