from django.conf.urls import url
from users.views import UserLogin, UserRegister,  UserIifo, LogoutView, mianIifoViws, messageViws

urlpatterns = [
    url(r'^login/$', UserLogin.as_view(), name='login'),
    url(r'^reg/$', UserRegister.as_view(), name='reg'),
    url(r'^info/$', UserIifo.as_view(), name='info'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^mian/$', mianIifoViws.as_view(), name='mian'),
    url(r'^message/(?P<user_id>\d+)/$', messageViws.as_view(), name='message')

]