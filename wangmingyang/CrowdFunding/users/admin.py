from .models import *
import xadmin
from xadmin import views
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True
xadmin.site.register(views.BaseAdminView, BaseSetting)


class GlobalSettings(object):
    site_title = "众筹后台管理系统"
    site_footer = "众筹网"
    menu_style = "accordion"

xadmin.site.register(views.CommAdminView, GlobalSettings)


class EmailVerifyRecordAdmin(object):
    list_display= {'code', 'email', 'send_type', 'send_time'}
    search_fields=['code', 'email', 'send_type']
    list_filter={'code', 'email', 'send_type', 'send_time'}

xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)

class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']

xadmin.site.register(Banner, BannerAdmin)


class MemberAdmin(object):
    list_display = ['username', 'realname', 'cardnum', 'authstatus', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(Member, MemberAdmin)
