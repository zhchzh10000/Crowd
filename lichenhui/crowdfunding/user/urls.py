from django.conf.urls import url
from .views import RegView,LoginView,LogoutView,MemberCenterView,MyCrowdFundingView,AccountTypeView,AccountInfoView,AccountIDView,AccountEmailView,AccountVCView

urlpatterns = [
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^logout/$',LogoutView.as_view(),name='logout'),
    url(r'^register/$',RegView.as_view(),name='register'),
    url(r'^member/$',MemberCenterView.as_view(),name='member_center'),
    url(r'^my_funding/$',MyCrowdFundingView.as_view(),name='my_funding'),
    url(r'^account_type/$', AccountTypeView.as_view(), name='account_type'),
    url(r'^account_info/$', AccountInfoView.as_view(), name='account_info'),
    url(r'^account_id/$', AccountIDView.as_view(), name='account_id'),
    url(r'^account_email/$', AccountEmailView.as_view(), name='account_email'),
    url(r'^account_vc/$', AccountVCView.as_view(), name='account_vc'),
]