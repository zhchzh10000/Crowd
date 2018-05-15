import xadmin
from .models import EmailVerifyRecord, Banner, Cert, UserProfile
from xadmin import views


class EmailVerifyRecordAdmin(object):
	list_display = {'email', 'code', 'send_type', 'send_time'}
	search_fields = {'email', 'code', 'send_type'}
	list_filter = {'email', 'code', 'send_type'}


class BannerAdmin(object):
	list_display = ['title', 'image', 'url', 'index', 'add_time']
	search_fields = ['title', 'image', 'url', 'index']
	list_filter = ['title', 'image', 'url', 'index', 'add_time']


class CertAdmin(object):
	list_display = {'cert_type', 'cert_company', 'cert_pay', 'cert_number', 'cert_phone', 'cert_info'}
	search_fields = {'cert_type', 'cert_company', 'cert_pay', 'cert_number', 'cert_phone', 'cert_info'}
	list_filter = {'cert_type', 'cert_company', 'cert_pay', 'cert_number', 'cert_phone', 'cert_info'}


class BaseSetting(object):
	enable_themes = True
	use_bootswatch = True


class GlobalSettings(object):
	site_title = "尚筹后台管理系统"
	site_footer = "尚筹网"
	menu_style = "accordion"


xadmin.site.register(Cert, CertAdmin)
xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(views.BaseAdminView, BaseSetting)
