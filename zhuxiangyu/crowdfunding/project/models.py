from django.db import models
from user.models import UserProfile
import datetime
import time

#后期优化建表，设立权重值的字段，可按权重排序，包括项目的权重值排序————————————————————————————————————
CATEGORY_TYPE = {
    'technology': '科技',
    'design': '设计',
    'public_welfare': '公益',
    'agriculture': '农业',
    'culture':'文化',
}

TAGE_TYPE = {
    'mobile': '手机',
    'computer': '电脑',
    'digital': '数码',
}
# 项目众筹状态
ACTIVE_STATUS = {
    '0': '即将开始',
    '1': '众筹中',
    '2': '众筹成功',
}

# 项目审核状态
CHECK_STATUS = {
    '0': '审核中',
    '1': '审核通过',
    '2': '审核未通过',
}

# '''
# 项目分类表------>可扩展为一张单独的表，rest需分离
# '''
# class Category(models.Model):
#     type = models.CharField(max_length=20,verbose_name='项目分类', default='technology')

'''
项目分类属性
'''
class Category(models.Model):
    category_type = models.CharField(max_length=20, verbose_name='项目分类', default='科技')

    class Meta:
        verbose_name = '项目分类属性表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.category_type
    
'''
项目标签属性
'''
class Tage(models.Model):
    tage_type = models.CharField(max_length=10, default='手机', verbose_name='项目标签')

    class Meta:
        verbose_name = '项目标签属性表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.tage_type

    
    
'''
项目信息
'''
class ProjectInfo(models.Model):
    # category_type = ((key, value) for key, value in CATEGORY_TYPE.items())
    # tage_type = ((key, value) for key, value in TAGE_TYPE.items())
    active_status = ((key, value) for key, value in ACTIVE_STATUS.items())
    check_status = ((key, value) for key, value in CHECK_STATUS.items())

    category_type = models.ForeignKey(Category,verbose_name='项目所属分类')
    tage_type = models.ManyToManyField(Tage,verbose_name='项目所属标签')
    
    name = models.CharField(max_length=50, default='项目1', verbose_name='众筹项目名字')
    desc = models.CharField(max_length=200, verbose_name='项目一句话简述')
    fav_num = models.IntegerField(verbose_name='关注人数',default=0)
    target_money = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='目标金额')
    raised_money = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='已筹金额',default=0)
    total_time = models.IntegerField(verbose_name='筹资天数', default=30)
    create_time = models.DateField(auto_now_add=True,verbose_name='创建日期')
    
    main_img = models.ImageField(max_length=100, verbose_name='项目头图', upload_to='main_img/%Y/%m',
                                    default='main_img/default.png')
    detail_img = models.ImageField(max_length=100, verbose_name='项目详情', upload_to='detail_img/%Y/%m',
                                    default='detail_img/default.png')
    
    active_status = models.CharField(max_length=10,choices=active_status, verbose_name='项目众筹状态', default='0')
    check_status = models.CharField(max_length=10,choices=check_status, verbose_name='项目审核状态', default='0')
    is_del = models.BooleanField(default=True,verbose_name='标记删除')
    
    support_people = models.IntegerField(verbose_name='支持人数',default=0)

    brief_intro = models.CharField(max_length=100, verbose_name='自我介绍',default='自我介绍')
    detail_intro = models.TextField(verbose_name='详细自我介绍',default='详细自我介绍')
    mobile = models.CharField(max_length=11, verbose_name='联系电话',default='123')
    service_phone = models.CharField(max_length=11, verbose_name='客服电话',default='123')
    
    # initiator = models.ForeignKey(InitiatorInfo, verbose_name='项目发起人或机构')
    user = models.ForeignKey(UserProfile,verbose_name='发起项目的用户',default=1)
    
    class Meta:
        verbose_name = '项目信息'
        verbose_name_plural = verbose_name
    
    def __str__(self):
        return self.name
    
    # 获取项目截止时间
    def get_finish_time(self):
        finish_time = self.create_time + datetime.timedelta(self.total_time)
        # 格式化时间的字符串，加str
        return str(finish_time)
    
    # 获取项目剩余天数
    def get_left_day(self):
        date1 = time.strptime(self.get_finish_time(), "%Y-%m-%d")
        date2 = time.strptime(time.strftime('%Y-%m-%d',time.localtime(time.time())), "%Y-%m-%d")
        
        date1 = datetime.datetime(date1[0], date1[1], date1[2])
        date2 = datetime.datetime(date2[0], date2[1], date2[2])
        
        left_day = date1 - date2
        return left_day.days
    
    # 得到项目的众筹进度
    def get_rate(self):
        rate = int(self.raised_money)/int(self.target_money)*100
        print('----------',int(rate))
        return int(rate)


'''
回报信息
'''
class RepayInfo(models.Model):
    type = models.CharField(max_length=10,choices=(('reality', '实物回报'), ('virtual', '虚拟物品回报')), default='reality',
                            verbose_name='回报类型')
    support_money = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='支持金额')
    repay_content = models.TextField(verbose_name='回报内容')
    repay_img = models.ImageField(max_length=100, verbose_name='项目图片', upload_to='repay_img/%Y/%m',
                                  default='repay_img/default.png')
    repay_num = models.IntegerField(verbose_name='回报数量')
    is_limit_buy = models.CharField(max_length=10, choices=(('0', '不限购'), ('1', '限购')), verbose_name='单笔限购')
    limit_buy_num = models.IntegerField(verbose_name='限购数量',default=1)
    freight = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='运费')
    receipt = models.CharField(max_length=10, choices=(('0', '不可开发票'), ('1', '可开发票')), verbose_name='是否开发票')
    repay_time = models.IntegerField(verbose_name='回报时间')
    
    project = models.ForeignKey(ProjectInfo, verbose_name='众筹项目')
    
    class Meta:
        verbose_name = '回报信息'
        verbose_name_plural = verbose_name
    
    def __str__(self):
        return str(self.support_money)+'--'+self.repay_content


'''
项目收款账号及身份核实
'''
class AccountNumInfo(models.Model):
    company_num = models.CharField(max_length=11, verbose_name='易付宝企业账号')
    id_card = models.CharField(max_length=18, verbose_name='法人身份证号')
    user = models.ForeignKey(UserProfile, verbose_name='收款的用户')
    project = models.ForeignKey(ProjectInfo, verbose_name='众筹项目')
    
    class Meta:
        verbose_name = '收款账号及身份核实'
        verbose_name_plural = verbose_name
    
    def __str__(self):
        return self.id_card


'''
用户关注项目表
'''
class UserFavProject(models.Model):
    addtime = models.DateTimeField(default=datetime.datetime.now, verbose_name='关注时间')
    user = models.ForeignKey(UserProfile, verbose_name='关注的用户')
    project = models.ForeignKey(ProjectInfo, verbose_name='被关注的项目')
    
    class Meta:
        verbose_name = '用户关注项目表'
        verbose_name_plural = verbose_name
    
    def __str__(self):
        return '{0}{1}'.format(self.user.username, self.project.name)


# '''
# 发起人或机构信息
# '''
# class InitiatorInfo(models.Model):
#     # user = models.ForeignKey(UserProfile,verbose_name='发起项目的用户') 报错
#     project = models.ForeignKey(ProjectInfo, verbose_name='众筹项目')
#     brief_intro = models.CharField(max_length=100, verbose_name='自我介绍')
#     detail_intro = models.TextField(verbose_name='详细自我介绍')
#     mobile = models.CharField(max_length=11, verbose_name='联系电话')
#     service_phone = models.CharField(max_length=11, verbose_name='客服电话')
#
#     class Meta:
#         verbose_name = '发起人信息'
#         verbose_name_plural = verbose_name
#
#     def __str__(self):
#         return self.brief_intro
