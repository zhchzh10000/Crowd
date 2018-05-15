import xadmin

# Register your models here.
from .models import Project,Order,Return,Tag,Twolable,Type,Banner
#项目表
class ProjectAdmin(object):
	list_display = ['name','remark','money','day','status','deploydate','supportmoney','completion','memberid','createdate',]
	search_fields = ['name','remark','money','day','status','deploydate','supportmoney','completion','memberid','createdate',]
	list_filter = ['name','remark','money','day','status','deploydate','supportmoney','completion','memberid','createdate',]

xadmin.site.register(Project,ProjectAdmin)
#订单表
class OrderAdmin(object):
	list_display = ['memberid','projectid','returnid','returnid','order_num','create_date','money','rtncount','status','address','invoice','invoictitle','remark']
	search_fields = ['memberid','projectid','returnid','returnid','order_num','create_date','money','rtncount','status','address','invoice','invoictitle','remark']
	list_filter = ['memberid','projectid','returnid','returnid','order_num','create_date','money','rtncount','status','address','invoice','invoictitle','remark']

xadmin.site.register(Order,OrderAdmin)


#回报表
class ReturnAdmin(object):
	list_display = ['projectid','type','supportmoney','content','count','purchase','freight','invoice','rtndate']
	search_fields =['projectid','type','supportmoney','content','count','purchase','freight','invoice','rtndate']
	list_filter = ['projectid','type','supportmoney','content','count','purchase','freight','invoice','rtndate']

xadmin.site.register(Return,ReturnAdmin)

from xadmin import views

class BaseSetting(object):
	enable_themes = True
	use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)

class GlobalSettings(object):
	site_title = "众筹后台管理系统"
	site_footer = "在线网"
	menu_style = "accordion"


xadmin.site.register(views.CommAdminView, GlobalSettings)

#标签
class TagAdmin(object):
	list_display = ['name']
	search_fileds = ['name']
	list_filter = ['name']

xadmin.site.register(Tag,TagAdmin)
xadmin.site.register(Twolable)

#分类
xadmin.site.register(Type)

#Banner
xadmin.site.register(Banner)