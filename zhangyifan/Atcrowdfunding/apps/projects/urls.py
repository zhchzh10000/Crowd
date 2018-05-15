from django.conf.urls import url
from projects import views


urlpatterns=[
	url(r'^projects/$', views.ProList.as_view(), name='projects'),  # 列表页
	url(r'^project/$', views.Project, name='project')
]