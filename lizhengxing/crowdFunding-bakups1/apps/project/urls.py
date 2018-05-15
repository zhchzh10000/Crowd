from django.conf.urls import url
from project.views import ProjectdDetail, ProjectIndex, Projects, SendCrowd, SendProject, Rerurn
urlpatterns = [

    url(r'^detail/(?P<project_id>\d+)/$', ProjectdDetail.as_view(), name='detail'),   #项目详情页
    url(r'^index/$', ProjectIndex.as_view(), name='index'),   #项目主页
    url(r'^projects/$', Projects.as_view(), name='projects'),   #x项目总览
    url(r'^sendstart/$', SendCrowd.as_view(), name='sendstart'),   #发起众筹
    url(r'^sendproject/$', SendProject.as_view(), name='sendproject'),
    url(r'^sendproject2/$', SendProject.as_view(), name='sendproject2'),
    url(r'^Rerurn/$', Rerurn.as_view(), name='Rerurn'),


]