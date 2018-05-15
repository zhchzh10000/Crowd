from django.conf.urls import url, include
from django.contrib import admin
from django.conf.urls import patterns, include, url
# from xadmin.plugins import xversion
import xadmin

from user import views
# xversion.register_models()
# xadmin.autodiscover()
from user.views import LogoutView, ActiveUserView

urlpatterns = [

    url(r'^reg/', views.UserRegisterView.as_view(),name='reg'),
    url(r'^login/', views.UserLoginView.as_view(), name='login'),
    url(r'^member/', views.MemberView.as_view(), name='member'),
    url(r'^message/', views.MessageView.as_view(), name='message'),
    url(r'^logout/', LogoutView.as_view(),name='logout'),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="user_active"),  # 提取出active后的所有字符赋给active_code


]
