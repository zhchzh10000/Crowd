from django.contrib import admin
from .models import AccountType,RealNameInfo,IDPicture
# Register your models here.

class AccountTypeAdmin(admin.ModelAdmin):
    list_display = ['type','member']
    search_fields = ['type','member__username']

class RealNameInfoAdmin(admin.ModelAdmin):
    list_display = ['real_name','id_card','phone_num','member']
    search_fields = ['real_name','id_card','phone_num','member__username']

class IDPictureAdmin(admin.ModelAdmin):
    list_display = ['pic','member']
    search_fields = ['pic','member__username']


admin.site.register(AccountType,AccountTypeAdmin)
admin.site.register(RealNameInfo,RealNameInfoAdmin)
admin.site.register(IDPicture,IDPictureAdmin)