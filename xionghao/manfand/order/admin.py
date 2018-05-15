from django.contrib import admin
import xadmin
from .models import OrderInfo,OrderAdress


class OrderInfoAdmin(object):
    list_display = ('start_company',)
    list_filter = ('start_company',)

xadmin.site.register(OrderInfo, OrderInfoAdmin)


class OrderAdressAdmin(object):
    list_display = ['rev_person','user__name']
    list_filter = ['rev_person','user__name']




xadmin.site.register(OrderAdress, OrderAdressAdmin)
# Register your models here.
