from django.db import models
import datetime

from db.base_model import BaseModels
from users.models import Member


class ProType(BaseModels):
    name = models.CharField(max_length=20,verbose_name='类型名称')
    desc = models.CharField(max_length=100,verbose_name='类型描述')

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'pro_type'
        verbose_name = '项目类型表'
        verbose_name_plural = verbose_name


class CrowdFundProjects(BaseModels):
    name = models.CharField(max_length=255,verbose_name='项目名称')
    remark = models.CharField(max_length=255,verbose_name='简介')
    money = models.DecimalField(max_digits=10,decimal_places=2,verbose_name='众筹金额')
    day = models.IntegerField(verbose_name='众筹天数')
    status = models.SmallIntegerField(default=0,choices=((0,'即将开始'),(1,'众筹中'),(2,'众筹成功'),(3,'众筹失败')),verbose_name='状态')
    daploydate = models.DateField(verbose_name='开始日期')
    supportmoney = models.DecimalField(max_digits=10,decimal_places=2,verbose_name='已筹资金')
    supporter = models.IntegerField(verbose_name='投资人数')
    member = models.ForeignKey(Member,on_delete=models.CASCADE,verbose_name='发起会员')
    pro_type = models.ForeignKey(ProType,on_delete=models.CASCADE,verbose_name='项目类型')
    follow_num = models.IntegerField(default=0,null=True,verbose_name='关注人数')
    hand_image = models.ImageField(upload_to='media/crowd/%Y%m',verbose_name='展示图片')

    def complete(self):
        self.com_degree = self.supportmoney/self.money*100
        self.save()
        return self.com_degree

    def endTime(self):
        # 计算众筹到期时间
        detaday = datetime.timedelta(days=self.day)
        da_days = self.daploydate + detaday
        self.endtime = da_days.strftime('%Y-%m-%d')
        self.save()
        return self.endtime

    def surplusTime(self):
        # 计算众筹剩余时间
        now_day=datetime.datetime.now().strftime('%Y-%m-%d')
        old_day = self.daploydate.strftime('%Y-%m-%d')

        day1 = datetime.datetime.strptime(now_day, '%Y-%m-%d')
        day2 = datetime.datetime.strptime(old_day, '%Y-%m-%d')
        if day1 < day2:
            self.status = 1
            return '众筹未开始'
        else:
            da_day = day1 - day2
            self.surplustime = self.day - da_day.days

            if self.surplustime < 0 and self.supportmoney >= self.money:
                self.status = 2
            elif self.surplustime < 0 and self.supportmoney < self.money:
                self.status = 3
        self.save()
        return self.surplustime

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'crowfund_project'
        verbose_name = '众筹项目表'
        verbose_name_plural = verbose_name


class DescImage(BaseModels):
    image = models.ImageField(upload_to='media/crowd/%Y/%m',max_length=100,verbose_name='详情图片')
    crowd = models.ForeignKey(CrowdFundProjects,verbose_name='对应项目')

    class Meta:
        db_table = 'crowd_image'
        verbose_name = '项目详情图片'
        verbose_name_plural = verbose_name


class Follow(BaseModels):
    member = models.ForeignKey(Member,verbose_name='会员')
    crowd = models.ForeignKey(CrowdFundProjects,verbose_name='项目')

    class Meta:
        verbose_name = '关注表'
        verbose_name_plural = verbose_name

