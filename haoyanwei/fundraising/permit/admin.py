# Register your models here.
import xadmin

from .models import Project, Tag, Type, Return,Twolable,Order,Follower

#标签
class TagAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = ['name']

xadmin.site.register(Tag, TagAdmin)
xadmin.site.register(Twolable)


#类别
class TypeAdmin(object):
    list_display = ['name','remark',]
    search_fields = ['name']
    list_filter = ['name']

xadmin.site.register(Type, TypeAdmin)


#项目
class ProjectAdmin(object):
    # 列表展示
    list_display = ['name','money', 'day', 'status', 'deploydate', 'supportmoney', 'createdate']
    #搜索字段
    search_fields = ['name',  'remark', 'money', 'status', 'deploydate', 'createdate']
    #过滤器
    list_filter = ['name',  'status', 'deploydate', 'createdate']

xadmin.site.register(Project,ProjectAdmin)


# # 回报
xadmin.site.register(Return)


from xadmin import views

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)

class GlobalSettings(object):
    site_title = "众筹平台——控制面板"
    site_footer = "众筹在线"
    menu_style = "accordion"


xadmin.site.register(views.CommAdminView, GlobalSettings)

xadmin.site.register(Order)

xadmin.site.register(Follower)