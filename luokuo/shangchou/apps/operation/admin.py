import xadmin

# Register your models here.
from operation.models import ReturnSetting


class ReturnSettingAdmin(object):
	list_display = {'r_num', 'r_type', 'support_money', 'r_content', 'r_image', 'r_total', 'r_limit', 'r_freight', 'r_invoice','r_date'}
	search_fields = {'r_num', 'r_type', 'support_money', 'r_content', 'r_image', 'r_total', 'r_limit', 'r_freight', 'r_invoice','r_date'}
	list_filter = {'r_num', 'r_type', 'support_money', 'r_content', 'r_image', 'r_total', 'r_limit', 'r_freight', 'r_invoice','r_date'}

xadmin.site.register(ReturnSetting, ReturnSettingAdmin)