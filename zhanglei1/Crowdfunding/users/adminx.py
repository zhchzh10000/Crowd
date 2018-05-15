__author__ = 'zhang'
__date__ = '2018/5/12 18:50'



import xadmin
from xadmin import views
from xadmin.plugins.auth import UserAdmin
from .models import Banner,Type


#主题
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


#后台名称
class GlobalSettings(object):
    site_title = '淘众筹后台管理系统'
    site_footer = '淘众筹在线网'
    menu_style = 'accordion'


class BannerAdmin(object):
#不能对时间进行search
    list_display = ['title','url','index','add_time','image']
    search_fields = ['title','url','index','image']
    list_filter = ['title','url','index','add_time','image']

    model_icon = 'fa fa-angle-double-right'



class TypeAdmin(object):
    pass
#主题的注册
xadmin.site.register(views.BaseAdminView,BaseSetting)
#后台的左上角的文字和正下的中间的位置的文字
xadmin.site.register(views.CommAdminView,GlobalSettings)

xadmin.site.register(Banner,BannerAdmin)
xadmin.site.register(Type,TypeAdmin)