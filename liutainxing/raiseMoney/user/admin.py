from django.contrib import admin

from xadmin import views
# from .models import UserProfile
import xadmin
from .models import Banner
# Register your models here.
#class FelixProjectsAdmin(admin.ModelAdmin):
class FelixProjectsAdmin(object):
    list_display = ('email', 'authstatus', 'usertype')

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "尚筹后台管理系统"
    site_footer = "尚筹网"
    menu_style = "accordion"

xadmin.site.register(Banner)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(views.BaseAdminView, BaseSetting)
# xadmin.site.register(UserProfile, FelixProjectsAdmin)