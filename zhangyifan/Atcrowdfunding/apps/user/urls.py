from django.conf.urls import url
from user import views

urlpatterns = [
    url(r'index/$', views.index, name='index'), # 首页
    url(r'login/$', views.UserLogin.as_view(), name='login'),
    url(r'^register/$', views.RegisterView.as_view(), name='register'), # 列表页
    url(r'start/$', views.InitiateView.as_view(), name='start')
]








