from django.contrib import admin

# Register your models here.
from users.models import UserProfile, Advertisement
admin.site.register([UserProfile, Advertisement])

