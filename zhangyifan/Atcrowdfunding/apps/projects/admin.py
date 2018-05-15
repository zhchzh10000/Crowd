# Register your models here.
import xadmin
from .models import Project


class ProjectAdmin(object):
	list_display = { 'category','name','money','day','status','deploydate','supporter','supportmoney','completion','follower'}
	search_fields = {'category','name','money','day','status','deploydate','supporter','supportmoney','completion','follower'}
	list_filter = {'category','name','money','day','status','deploydate','supporter','supportmoney','completion','follower'}



xadmin.site.register(Project,ProjectAdmin)
