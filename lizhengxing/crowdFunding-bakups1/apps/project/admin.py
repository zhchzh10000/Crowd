from django.contrib import admin
from .models import Project, Banner,ProjectType, PorjectTag, State, Return

admin.site.register([Project, Banner, ProjectType, PorjectTag, State, Return])

