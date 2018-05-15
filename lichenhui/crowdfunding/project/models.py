from django.db import models
# from datetime import datetime,timedelta
import datetime
from user.models import MemberProfile


class Project(models.Model):
    # 项目名称
    name = models.CharField(max_length=255,verbose_name='项目名称')
    # 一句话描述
    remark = models.CharField(max_length=255,verbose_name='项目描述')
    # 目标金额
    target_money = models.IntegerField(default=0,verbose_name='目标金额')
    # 已筹金额
    support_money = models.IntegerField(default=0, verbose_name='已筹金额')

    # 项目头图
    project_cover = models.ImageField(upload_to='project/cover', verbose_name='项目头图')
    # 项目大图
    project_info = models.ImageField(upload_to='project/info', verbose_name='项目详情图')

    # 完成进度
    completion = models.IntegerField(default=0,verbose_name='完成进度')
    # 支持人数
    supporters = models.IntegerField(default=0,verbose_name='支持人数')
    # 项目状态
    status = models.IntegerField(default=0,choices=((0,'即将开始'),(1,'众筹中'),(2,'众筹成功'),(3,'众筹失败')),verbose_name='项目状态')

    # 筹集天数
    period = models.IntegerField(default=0, verbose_name='筹集天数')
    # 发布日期
    create_date = models.DateTimeField(auto_now_add=True,verbose_name='发布日期')
    # 上线日期
    deploy_date = models.DateTimeField(default=datetime.datetime.now,verbose_name='上线日期')

    # 引入外键：发起人
    member = models.ForeignKey('user.MemberProfile',verbose_name='发起人')

    # 项目分类
    type = models.IntegerField(default=0,choices=((0,'科技'),(1,'设计'),(2,'公益'),(3,'农业'),(4,'文化')),verbose_name='项目分类')
    # 项目标签
    tag = models.CharField(max_length=5,default='tag',verbose_name='项目标签')

    # 添加发起人信息
    # 一句话介绍
    a_word_intro = models.CharField(max_length=40, verbose_name='一句话自我介绍')
    # 详细介绍
    self_intro = models.TextField(max_length=160,verbose_name='详细自我介绍')
    # 电话号码
    phone_number = models.CharField(max_length=13, verbose_name='联系电话')
    # 客服电话
    service_number = models.CharField(max_length=13, verbose_name='客服电话')

    def __str__(self):
        return self.name

    def get_completion(self):
        self.completion = round(self.support_money/self.target_money,2)
        return int(self.completion*100)

    def deadline(self):
        period = datetime.timedelta(days=self.period)
        deadline = self.deploy_date + period
        return deadline

    class Meta:
        db_table = 'project'
        verbose_name = '项目信息'
        verbose_name_plural = verbose_name


class Tag(models.Model):
    tag_name = models.CharField(max_length=10,verbose_name='标签名称')

    def __str__(self):
        return self.tag_name

    class Meta:
        db_table = 'tag'
        verbose_name = '一级标签'
        verbose_name_plural = verbose_name


class SubTag(models.Model):
    sub_tag_name = models.CharField(max_length=10,verbose_name='二级标签名称')
    parent_tag = models.ForeignKey(Tag,verbose_name='关联父标签')

    def __str__(self):
        return self.sub_tag_name

    class Meta:
        db_table = 'sub_tag'
        verbose_name = '二级标签'
        verbose_name_plural = verbose_name


class Return(models.Model):
    # 所属项目
    project = models.ForeignKey(Project,verbose_name='所属项目')
    # 类型
    type = models.IntegerField(default=0,choices=((0,'实物回报'),(1,'虚拟物品回报')),verbose_name='回报类型')
    # 支持金额
    support_money = models.IntegerField(default=0,verbose_name='支持金额')
    # 回报内容
    content = models.CharField(max_length=200,verbose_name='回报内容')
    # 说明图片
    img = models.ImageField(upload_to='project/return',verbose_name='回报说明图片')
    # 回报数量
    return_num = models.IntegerField(default=0,verbose_name='回报数量')
    # 是否限购
    limit_or_not = models.IntegerField(default=0,choices=((0,'不限购'),(1,'限购')),verbose_name='是否限购')
    # 限购，单笔限购数量
    one_order_limit = models.IntegerField(default=0,verbose_name='单笔限购数量')
    # 运费
    trans_expenses = models.IntegerField(default=0,verbose_name='运费')
    # 是否开发票
    invoice = models.IntegerField(default=0,choices=((0,'不可开发票'),(1,'开发票')),verbose_name='是否开发票')
    # 回报时间
    return_days = models.IntegerField(default=0,verbose_name='回报时间')

    class Meta:
        db_table = 'return'
        verbose_name = '回报信息'
        verbose_name_plural = verbose_name