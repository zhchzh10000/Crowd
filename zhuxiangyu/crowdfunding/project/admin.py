from django.contrib import admin
from .models import ProjectInfo,RepayInfo,AccountNumInfo
# Register your models here.

admin.site.register([ProjectInfo,RepayInfo,AccountNumInfo])
