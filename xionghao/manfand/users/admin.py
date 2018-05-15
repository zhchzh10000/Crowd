from django.contrib import admin
import xadmin
from .models import UserMsg
# Register your models here.
class UserMsgAdmin(object):
    list_display = ['name','email']
    search_fields = ['name']
    list_filter = ['name','email']

from xadmin import views
class BaseSetting(object):
       enable_themes = True
       use_bootswatch = True
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(UserMsg, UserMsgAdmin)
