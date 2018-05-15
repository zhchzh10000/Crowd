from users.views import *
from django.conf.urls import url
urlpatterns = [
    url(r'^$', IndexView.as_view(),name='index'),
    url(r'^login/$', UserLogin.as_view(),name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^reg/$',RegistView.as_view(),name='reg'),
    url(r'^member/$',MemberView.as_view(),name='member'),
    url(r'^crowd/$',MyCrowdView.as_view(),name='crowd'),
    url(r'^active/(?P<active_code>.*)/$', AciveUserView.as_view(), name="user_active"),
    ]
