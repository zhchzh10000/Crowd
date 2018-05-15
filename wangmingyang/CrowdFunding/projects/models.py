from django.db import models
from datetime import datetime
# Create your models here.


class ProjectType(models.Model):
    type = models.CharField(max_length=20, verbose_name="类型")
    add_time = models.DateTimeField(default=datetime.now)
    class Meta:
        verbose_name = "类型"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.type


class TagFirst(models.Model):
    tag = models.CharField(max_length=20, verbose_name='标签')
    add_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = "一级标签表"
        verbose_name_plural = verbose_name


class TagSecond(models.Model):
    tag = models.CharField(max_length=20, verbose_name='二级标签')
    # tag1 = models.ForeignKey(TagFirst, verbose_name='一级标签')
    add_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = "二级标签表"
        verbose_name_plural = verbose_name


class Project(models.Model):
    project_name = models.CharField(max_length=50,verbose_name='项目名字')
    remark = models.CharField(max_length=100,verbose_name='项目描述')
    in_short = models.CharField(max_length=100,verbose_name='一句话简介')
    status = models.IntegerField(verbose_name='众筹状态',choices=((0,'即将开始'),(1,"众筹中"),(2,"众筹失败"),(3,"众筹成功")),default=0)
    target_money = models.IntegerField(default=0,verbose_name='目标金额')
    support_money = models.IntegerField(default=0, verbose_name='筹集金额')
    project_title = models.ImageField(upload_to='project/title', verbose_name='项目头图')
    project_desc = models.ImageField(upload_to='project/desc', verbose_name='项目详情图')
    completion = models.DecimalField(default=0.00,max_digits=4,decimal_places=2,verbose_name='完成进度')
    supporters = models.IntegerField(default=0,verbose_name='支持人数')
    period = models.IntegerField(default=0, verbose_name='筹集天数')
    create_date = models.DateTimeField(auto_now_add=True,verbose_name='发布日期')
    deploy_date = models.DateTimeField(default=datetime.now,verbose_name='上线日期')
    introduce = models.CharField(max_length=80, verbose_name='自我介绍')
    introduce_desc = models.CharField(max_length=100, verbose_name='详细自我介绍')
    phone = models.CharField(max_length=11, verbose_name='联系电话')
    customer_phone = models.CharField(max_length=11, verbose_name='客服电话')
    type = models.ForeignKey(ProjectType, verbose_name='项目分类',null=True,blank=True)
    tag1 = models.ForeignKey(TagFirst,null=True,blank=True)
    tag2 = models.ForeignKey(TagSecond,null=True,blank=True)


    class Meta:
        verbose_name = "项目表"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.project_name




