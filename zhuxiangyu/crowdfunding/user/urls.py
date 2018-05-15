from django.conf.urls import url
from django.views.generic import TemplateView
from .views import LoginView,RegisterView,UserInfoView,UserFundingView,UserCertifyApplyView,UserCertifyBaseInfoView,\
    UserCertifyLoadImgView,UserCertifyEmailView,UserCertifyVerifyView,AddAddressView,LogoutView


urlpatterns = [
    # 用户登录注册
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^register/$', RegisterView.as_view(), name='register'),
    url(r'^userinfo/$', UserInfoView.as_view(), name='userinfo'),
    url(r'^userfunding/$', UserFundingView.as_view(), name='userfunding'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    
    # 用户实名认证
    url(r'^usercertify_apply/$', UserCertifyApplyView.as_view(), name='usercertify_apply'),
    url(r'^usercertify_baseinfo/$', UserCertifyBaseInfoView.as_view(), name='usercertify_baseinfo'),
    url(r'^usercertify_loadimg/$', UserCertifyLoadImgView.as_view(), name='usercertify_loadimg'),
    url(r'^usercertify_email/$', UserCertifyEmailView.as_view(), name='usercertify_email'),
    url(r'^usercertify_verify/$', UserCertifyVerifyView.as_view(), name='usercertify_verify'),
    
    #添收货地址
    url(r'^add_address/$', AddAddressView.as_view(), name='add_address'),

]

