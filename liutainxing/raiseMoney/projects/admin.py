from django.contrib import admin

from xadmin import views
from .models import TProject,TProjectTag
import xadmin
# Register your models here.
#class FelixProjectsAdmin(admin.ModelAdmin):
class FelixProjectsAdmin(object):
    list_display = ('name', 'status', 'daploydate')

xadmin.site.register(TProject, FelixProjectsAdmin)
xadmin.site.register(TProjectTag)