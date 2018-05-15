from django.db import models
from datetime import datetime


# 项目类型
class ProjectType(models.Model):

    name = models.CharField(max_length=255, verbose_name='项目类型')
    remark = models.CharField(max_length=255, verbose_name='描述')


    class Meta:
        verbose_name = '项目类型'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name


# 项目信息
class Project(models.Model):
    name = models.CharField(max_length=255, verbose_name='项目名称')
    remark = models.CharField(max_length=255, verbose_name='简介')
    money = models.BigIntegerField(default=0, verbose_name='金额')
    day = models.IntegerField(default=0, verbose_name='天数')
    status = models.CharField(default=0, max_length=1, choices=(('0', '即将开始'),
                                                     ('1', '众筹中'),
                                                     ('2', '众筹成功'),
                                                     ('3', '众筹失败')
                                                     ),
                              verbose_name='众筹状态')
    deploydate = models.CharField(default=0, max_length=10, verbose_name='部署日期')
    supportmoney = models.IntegerField(default=0, verbose_name='支持金额')
    supporter = models.IntegerField(default=0, verbose_name='支持者数量')
    completion = models.IntegerField(default=0, verbose_name='完成数量')
    memberid = models.IntegerField(default=0, verbose_name='会员id')
    createdate = models.DateTimeField(null=True, blank=True, default=datetime.now, verbose_name=u"创建时间")
    stopdate = models.DateTimeField(null=True, blank=True, default=datetime.now, verbose_name=u"截止日期")
    follower = models.IntegerField(default=0, verbose_name='支持者数量')
    cash = models.IntegerField(default=0, verbose_name='已筹金额')
    Target_amount = models.IntegerField(default=0, verbose_name='目标金额')
    reach = models.IntegerField(default=0, verbose_name='达成进度')
    send = models.CharField(default=0, max_length=10, verbose_name='配送运费')
    image = models.ImageField(upload_to="image/%Y/%m", verbose_name='项目图片')
    project_type = models.ForeignKey(ProjectType, verbose_name='项目类型', null=True, blank=True)
    info = models.CharField(default='', max_length=400, verbose_name='一句话简介')
    infos = models.CharField(default='', max_length=2000, verbose_name='详细介绍')
    infoimage = models.ImageField(upload_to="image/%Y/%m", verbose_name='详情图片')

    my_info = models.CharField(max_length=2000, verbose_name='自我介绍')
    my_infos = models.CharField(max_length=2000, verbose_name='详细自我介绍')
    phone = models.IntegerField(default=0, null=True, blank=True, verbose_name=u'手机号')
    service = models.IntegerField(null=True, blank=True, verbose_name=u'客服电话')


    class Meta:
        verbose_name = '项目信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name



#Banner图

class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.title


# 项目标签
class PorjectTag(models.Model):
    name = models.CharField(default='', max_length=255, verbose_name='标签名')
    pid = models.ManyToManyField(Project, verbose_name='项目标签')

    class Meta:
        verbose_name = u"项目标签"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

# 众筹状态
class State(models.Model):
    name = models.CharField(max_length=200, verbose_name='众筹状态')
    pid = models.ForeignKey(Project, verbose_name='项目id')

    class Meta:
        verbose_name = u"项目状态"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

# 设置回报
class Return(models.Model):
    return_type = models.CharField(default=0, max_length=1, choices=(('0', '实物回报'),
                                            ('1', '虚拟物品回报')), verbose_name='回报类型')
    supportmoney = models.IntegerField(default=0, verbose_name='支持金额')
    content = models.CharField(max_length=2000, verbose_name='回报内容')
    retimage = models.ImageField(upload_to='retimage/%Y/%m', verbose_name='回报图片')
    retnum = models.IntegerField(default=0, verbose_name='回报数量')
    count = models.IntegerField(default=0, verbose_name='单笔限购')
    freight = models.IntegerField(default=0, verbose_name='运费')
    invoice = models.CharField(max_length=1, choices=(('0', '不可开发票'),
                                                      ('1', '可开发票')), verbose_name='发票')
    rtndate = models.IntegerField(default=1, verbose_name='回报时间')
    name = models.ForeignKey(Project, verbose_name='关联项目')


    class Meta:
        verbose_name = '项目回报'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name





