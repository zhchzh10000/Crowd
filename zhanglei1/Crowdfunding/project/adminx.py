__author__ = 'zhang'
__date__ = '2018/5/12 18:51'

import xadmin
from .models import Project,ProjectName,Company,Label


class ProjectAdmin(object):
    pass


class ProjectNameAdmin(object):
    pass


class CompanyAdmin(object):
    pass

class LabelAdmin(object):
    pass

xadmin.site.register(Project,ProjectAdmin)
xadmin.site.register(ProjectName,ProjectNameAdmin)
xadmin.site.register(Company,CompanyAdmin)
xadmin.site.register(Label,LabelAdmin)



