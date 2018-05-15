from django.contrib import admin
from users.models import StaffUser,Member,RealName
# Register your models here.
admin.site.register([StaffUser, Member,RealName])
