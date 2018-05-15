from django.conf.urls import url
from users import views
from .views import index,projects,start,minecrowdfunding,startstep, prodetail
from crown_funding.settings import MEDIA_ROOT
from django.views.static import serve

urlpatterns = [
	url(r'^$',index,name='index'),
	url(r'^prodetail/$',prodetail,name='prodetail'),
	url(r'^media/(?P<path>.*)$',serve,{"document_root":MEDIA_ROOT}),
	url(r'^projects/$',projects,name='projects'),
	url(r'start/$',start,name='start'),
	url(r'minecrowdfunding/$',minecrowdfunding,name='minecrowdfunding'),
	url(r'startstep/$',startstep,name='startstep'),
	# url(r'^prodetail/(?P<pro_id>\d)/$',prodetail,name='project')

]


