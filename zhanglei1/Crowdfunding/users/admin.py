from django.contrib import admin

# Register your models here.
from .models import UserProfile,Banner,Type

admin.site.register(UserProfile)
admin.site.register(Banner)
admin.site.register(Type)