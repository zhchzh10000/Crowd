from django.conf.urls import url
from users import views
urlpatterns = [
	# 首页
	url(r'^$',views.IndexView.as_view(),name='index'),
	# 登录
	url(r'^login/$',views.UserLoginView.as_view(),name='login'),
	# 注册
	url(r'^register/$',views.UserRegisterView.as_view(),name='register'),
	# 注册激活
	url(r'^active/(?P<active_code>.*)',views.ActiveUserView.as_view(),name='active'),
	# 退出
	url(r'^logout/$',views.UserLogoutView.as_view(),name='logout'),

	# 发起众筹 1
	url(r'^ini1/$',views.InitiateView.as_view(),name='ini1'),
	url(r'^ini2/$', views.Initiate2View.as_view(), name='ini2'),
	url(r'^ini3/(?P<pro_id>.*)',views.AddGoods.as_view(),name='addgood'),
	url(r'^ini4/$',views.Initiate4View.as_view(),name='ini4'),
	url(r'^ini5/$',views.Initiate5View.as_view(),name='ini5'),
	# 用户中心
	url(r'^info/$',views.UserInfo.as_view(),name='info'),
	url(r'^mine/$',views.MyDevious.as_view(),name='mine'),
	url(r'^real/$',views.RealName.as_view(),name='real'),

]