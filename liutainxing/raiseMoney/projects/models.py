from datetime import datetime
from django.db import models
from db.base_model import BaseModel
from user.models import UserProfile
class TProject(BaseModel):
    COLLECTION_CHOICES_and_FOLLOW_CHOICES = (
        (1, '是'),
        (0, '否')
    )
    CATEGORY_CHOICES = (
        ('kj', '科技'),
        ('sj', '设计'),
        ('ny', '农业'),
        ('qt', '其他'),

    )
    name = models.CharField(max_length=255,verbose_name='项目名称')
    image = models.ImageField( upload_to='image/%Y/%m', verbose_name='图片')
    describe = models.CharField(max_length=300, verbose_name='描述', null=True, blank=True)
    # url = models.URLField(verbose_name='访问链接', default='#')
    money = models.BigIntegerField(verbose_name='众筹金额')
    day = models.IntegerField(verbose_name='众筹天数',null=True)
    status = models.IntegerField(choices=((0,'即将开始'),(1,'众筹中'),(2,'众筹成功'),(3,'众筹失败')),default=0,verbose_name='状态')
    daploydate = models.DateField(verbose_name='开始日期')
    is_collection = models.BooleanField(choices=COLLECTION_CHOICES_and_FOLLOW_CHOICES, verbose_name='是否收藏', default=0)
    is_category = models.CharField(choices=CATEGORY_CHOICES, verbose_name='类别', default='科技', max_length=2)
    is_follow = models.BooleanField(choices=COLLECTION_CHOICES_and_FOLLOW_CHOICES, verbose_name='是否关注', default=0)
    enddate = models.DateField( verbose_name='截止日期')
    supportmoney = models.BigIntegerField(verbose_name='已筹资金',default=0 )
    supporter = models.IntegerField(verbose_name='投资人数',default=0)
    member = models.ForeignKey(UserProfile,on_delete=models.CASCADE,verbose_name='发起会员')
    tagss = models.ForeignKey(TTag,verbose_name='类型标签')

    # cate = models.ForeignKey(Cate,on_delete=models.CASCADE)
    # hand_image = models.ImageField(upload_to='crowd/%Y%m',verbose_name='展示图片')
    def get_time(self):

        starttime = self.enddate

        endtime = datetime.now()
        starttime = datetime.strptime(starttime.strftime('%Y-%m-%d'), '%Y-%m-%d')
        endtime = datetime.strptime(endtime.strftime('%Y-%m-%d'), '%Y-%m-%d')
        remain_time = (starttime - endtime).days
        if remain_time >0:
            self.status =1
        elif remain_time <=0:
            if self.money <= self.supportmoney:
                self.status = 2
            else:
                self.status =3
        return remain_time


    class Meta:
        db_table = 'crowfund_project'
        verbose_name = '众筹项目表'
        verbose_name_plural = verbose_name


class Company(models.Model):
    IS_ACTIVE_CHOICES = (
        (1, '是'),
        (0, '否')
    )
    name = models.CharField(max_length=100, verbose_name='名称', null=True, blank=True)
    is_active = models.BooleanField(choices=IS_ACTIVE_CHOICES, verbose_name='是否认证', default=0)
    describe = models.CharField(max_length=300, verbose_name='描述', null=True, blank=True)
    commodity = models.ForeignKey(TProject, on_delete=models.CASCADE, verbose_name='公司商品')
    mobile = models.CharField(max_length=13, verbose_name='联系电话')

    # meta信息，即后台栏目名
    class Meta:
        verbose_name = "公司信息"
        verbose_name_plural = verbose_name

    # 重载__str__方法，打印实例会打印username，username为继承自AbstractUser
    def __str__(self):
        return self.name


class TProjectTag(models.Model):
    projectid = models.ForeignKey(TProject, models.DO_NOTHING, db_column='projectid', blank=True, null=True,verbose_name='产品id')
    tagid = models.ForeignKey('TTag', models.DO_NOTHING, db_column='tagid', blank=True, null=True,verbose_name='标签id')

    class Meta:
        db_table = 't_project_tag'
        verbose_name='产品标签'
        verbose_name_plural=verbose_name


class TProjectType(models.Model):
    projectid = models.ForeignKey(TProject, models.DO_NOTHING, db_column='projectid', blank=True, null=True)
    typeid = models.ForeignKey('TType', models.DO_NOTHING, db_column='typeid', blank=True, null=True)

    class Meta:
        db_table = 't_project_type'
        verbose_name='产品类型'
        verbose_name_plural=verbose_name

class TTag(models.Model):
    pid = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 't_tag'
        verbose_name='标签'
        verbose_name_plural=verbose_name
class TType(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 't_type'
        verbose_name='类型'
        verbose_name_plural=verbose_name







