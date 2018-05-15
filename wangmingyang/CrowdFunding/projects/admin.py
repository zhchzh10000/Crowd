from .models import *
import xadmin

class ProjectAdmin(object):
    list_display= {'project_name', 'remark', 'status', 'target_money','support_money','project_title','project_desc','completion','supporters','period','create_date','deploy_date','type'}
    search_fields= {'project_name', 'remark', 'status', 'target_money','support_money','project_title','project_desc','completion','supporters','period','create_date','deploy_date','type'}
    list_filter={'project_name', 'remark', 'status', 'target_money','support_money','project_title','project_desc','completion','supporters','period','create_date','deploy_date','type'}

class ProjectTypeAdmin(object):
    list_display= {'type', 'add_time'}
    search_fields={'type', 'add_time'}
    list_filter={'type', 'add_time'}

xadmin.site.register(ProjectType, ProjectTypeAdmin)
xadmin.site.register(Project, ProjectAdmin)