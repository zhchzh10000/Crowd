from django.db import models

class BaseModel(models.Model):
	'''模型抽取基类'''
	is_delete = models.BooleanField(default=False, verbose_name='删除标记')
	create_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')


	class Meta:
		abstract = True



