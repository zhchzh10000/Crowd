from django.contrib import admin
from .models import Project,Tag,SubTag
# Register your models here.

class TagAdmin(admin.ModelAdmin):
    list_display = ['tag_name']
    search_fields = ['tag_name']

class SubTagAdmin(admin.ModelAdmin):
    list_display = ['sub_tag_name','parent_tag']
    search_fields = ['sub_tag_name','parent_tag__tag_name']


admin.site.register(Project)
admin.site.register(Tag,TagAdmin)
admin.site.register(SubTag,SubTagAdmin)