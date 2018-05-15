from django.contrib import admin
import xadmin
from .models import ProductMsg,CompanyMsg,ReProduct
# Register your models here.
class ProductMsgadmin(object):
    list_display= ["name",'desc']
    search_fields = ['name','desc','company__name']
    list_filter=["name",'desc']

xadmin.site.register(ProductMsg, ProductMsgadmin)

class CompanyMsgadmin(object):
    list_display= ["name",]
    search_fields = ['name']
xadmin.site.register(CompanyMsg, CompanyMsgadmin)

class ReProductadmin(object):
    list_display= ("product",)
    search_fields = ("product",)
xadmin.site.register(ReProduct, ReProductadmin)

