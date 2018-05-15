__author__ = 'zhang'
__date__ = '2018/5/11 15:49'

from django.conf.urls import url
from . import views

app_name = 'project'

urlpatterns = [
    #详情页面
    url(r'^detail/(?P<project_id>.*)/$',views.ProjectDetailView.as_view(),name='detail'),
#列表页面
    url(r'^list/$', views.ProjectList.as_view(), name='list'),
#开始
    url(r'^start/$', views.ProjectStart.as_view(), name='start'),
#第一步众筹
    url(r'^first/$', views.ProjectFirst.as_view(), name='first'),

    url(r'^second/$', views.ProjectSencend.as_view(), name='second'),

    url(r'^three/$', views.ProjectThree.as_view(), name='three'),

    url(r'^four/$', views.ProjectFour.as_view(), name='four'),

    url(r'^mine/$', views.ProjectMineCrow.as_view(), name='mine'),

    url(r'^our/$', views.ProjectOurCrow.as_view(), name='our'),

]