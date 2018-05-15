from django.db import models
from datetime import datetime


# 公司
class Company(models.Model):
    image_company = models.ImageField(upload_to='image_company/%Y/%m', default='image_company/default.png',max_length=100)
    company_name = models.CharField(verbose_name='公司名字', max_length=20)
    desc = models.CharField(verbose_name='公司简介', max_length=200)
    phone = models.CharField(verbose_name='公司电话',max_length=11)
    usename = models.CharField(max_length=10,verbose_name='发起人姓名')
    userdesc = models.CharField(max_length=100,verbose_name='自我介绍')
    userdetail = models.CharField(max_length=100,verbose_name='详细自我介绍')
    mobile = models.CharField(max_length=11,verbose_name='电话')

    class Meta:
        verbose_name = '公司详情'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.usename


class  ProjectName(models.Model):
    pyname = models.CharField(max_length=50,verbose_name='商品类别名')
    desc = models.CharField(max_length=100,verbose_name='列表解释')

    class Meta:
        verbose_name = '商品类别'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.pyname




#众筹计划
class Project(models.Model):

    company = models.ForeignKey(Company,on_delete=models.CASCADE,null=True)
    projectname = models.ForeignKey(ProjectName,on_delete=models.CASCADE,null=True)
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=100)
    name = models.CharField(max_length=50,verbose_name='众筹商品名')
    detail = models.CharField(max_length=300,verbose_name='备注',null=True, blank=True)
    url = models.URLField(verbose_name='访问链接', default='#')
    money = models.CharField(max_length=15, verbose_name='目标资金', default=0)
    end_money = models.CharField(max_length=15, verbose_name='已筹集资金', default=0)
    supporter = models.IntegerField(verbose_name='支持人数',default=0)
    is_collections = models.BooleanField(default=0,choices=((0,'否'),(1,'是')),verbose_name='是否收藏')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='创建时间')
    is_follow = models.BooleanField(default=0,choices=((0,'否'),(1,'是')),verbose_name='是否關注')
    end_time = models.DateTimeField(default=datetime.now,verbose_name='結束时间',null=True)
    time = models.IntegerField(verbose_name='天数',null=True)
    status = models.CharField(choices=(('jjks','即将开始'),('zcz','众筹中'),('zccg','众筹成功')),default='jjks',max_length=30)
    image_head = models.ImageField(upload_to='image_head/%Y/%m', default='image_head/default.png', max_length=100)
    image_body = models.ImageField(upload_to='image_body/%Y/%m', default='image_head/default.png', max_length=100)
    peoples = models.IntegerField(verbose_name='关注人数',null=True)

    class Meta:
        verbose_name = '众筹商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Label(models.Model):
    # project = models.ForeignKey(Project,on_delete=models.CASCADE,null=True,blank=True)
    label = models.CharField(max_length=100,verbose_name='标签')

# #众筹物品的状态
class Return(models.Model):
    project = models.ForeignKey(Project,on_delete=models.CASCADE,verbose_name='众筹计划',null=True)
    image_re = models.ImageField(upload_to='image_re/%Y/%m', default='image_re/default.png', max_length=100)
    type = models.CharField(choices=((0,'实物回报'),(1,'虚拟物品回报')),default=0,max_length=20,verbose_name='回报类型')
    supportmoney = models.IntegerField(verbose_name='支持金额')
    content = models.CharField(max_length=200,verbose_name='回报内容')
    count = models.IntegerField(default=0,verbose_name='回报数量')
    signalpurchase = models.IntegerField(verbose_name='配送金额')
    purchase = models.IntegerField(verbose_name='优惠金额')
    freight = models.CharField(max_length=100,verbose_name='支付方式')
    invoice = models.CharField(max_length=100,verbose_name='单笔限购',choices=((0,'不限购'),(1,'限购')))
    buy = models.CharField(max_length=100, verbose_name='是否开发票', choices=((0, '不开发票'), (1, '开发票')))
    rtndate = models.IntegerField(verbose_name='回报时间',null=True)


