import xadmin
from django.conf.urls import url, include
from django.contrib import admin

from projects import views
from projects.views import ProjectDetailViev
from user.views import IndexView

urlpatterns = [

    url(r'^list/', views.goodsListView.as_view(),name='pros_list'),
    url(r'^detail/(?P<pro_id>\d+)/$',ProjectDetailViev.as_view(),name='detail'),    #项目详情
    url(r'^start/', views.startProjectView.as_view(),name='start'),
    url(r'^start1/', views.startProject1View.as_view(),name='start1'),
]
