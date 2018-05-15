from django.contrib import admin
from crowd_project.models import CrowdFundProjects,ProType,DescImage,Follow
# Register your models here.

admin.site.register([CrowdFundProjects,ProType,DescImage,Follow])