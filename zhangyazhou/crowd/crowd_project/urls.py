from django.conf.urls import include, url
from crowd_project import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^detail/(?P<pro_id>\d+)/$',views.detail,name='detail'),
    url(r'^follow/$',views.follow,name='follow'),
    url(r'^list/$',views.project_list,name='list'),
]
