from django.conf.urls import url
from .views import UserLogin,RegisterView,Mycrowdfunding

urlpatterns = [

    url(r'^login/$', UserLogin.as_view(), name='login'),  # 用户登录
    url(r'^reg/$', RegisterView.as_view(), name='reg'),  # 用户注册
    url(r'^mycrowd/$', Mycrowdfunding.as_view(), name='mycrowd'),  # 我的众筹

]
