from django.conf.urls import url
from users import views
urlpatterns = [
    url(r'login/$',views.Login.as_view(),name='login'),
    url(r'reg/$',views.Register.as_view(),name='reg'),
    url(r'member/$',views.MemberView.as_view(),name='member'),
    url(r'mem/$',views.Member.as_view(),name='mem'),
    url(r'loginout/$',views.LoginOut.as_view(),name='loginout')
]