import xadmin

from .models import Project


class ProjectAdmin(object):
	list_display = ['category', 'image', 'name', 'remark', 'money', 'day', 'status', 'deploydate', 'supporter',
					'supportmoney', 'completion', 'memberid', 'createdate', 'follower']
	search_fields = ['category', 'image', 'name', 'remark', 'money', 'day', 'status', 'deploydate', 'supporter',
					 'supportmoney', 'completion', 'memberid', 'createdate', 'follower']
	list_filter = ['category', 'image', 'name', 'remark', 'money', 'day', 'status', 'deploydate', 'supporter',
				   'supportmoney', 'completion', 'memberid', 'createdate', 'follower']


xadmin.site.register(Project, ProjectAdmin)
