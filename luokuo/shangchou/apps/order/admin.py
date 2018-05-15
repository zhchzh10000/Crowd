import xadmin
from order.models import Order


class OrderAdmin(object):
	list_display = {'createdate', 'status', 'address', 'invoice', 'invoictitle', 'remark'}
	search_fields = {'createdate', 'status', 'address', 'invoice', 'invoictitle', 'remark'}
	list_filter = {'createdate', 'status', 'address', 'invoice', 'invoictitle', 'remark'}


xadmin.site.register(Order, OrderAdmin)
