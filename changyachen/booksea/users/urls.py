from  django.conf.urls import  url
from users import  views
urlpatterns = [
	url(r'^register/$',views.register,name='register'),
	url(r'^register_handle/$',views.register_handle,name='register_handle'),
	url(r'^login/$',views.login,name='login'),
    url(r'^login_check/$', views.login_check, name='login_check'),
	url(r'^logout/$',views.logout,name='logout'),
    url(r'^$', views.user, name='user'), # 用户中心-信息页
    url(r'^add/$', views.cart_add, name='add'), # 添加购物车数据
    url(r'^count/$', views.cart_count, name='count'), # 获取用户购物车中商品的数量
    url(r'^$', views.cart_show, name='show'), # 显示用户的购物车页面
    url(r'^del/$', views.cart_del, name='delete'), # 购物车商品记录删除
    url(r'^update/$', views.cart_update, name="update"),
	url(r'^address/$', views.address, name='address'),  # 用户中心-地址页
    url(r'^order/(?P<page>\d+)?/?$', views.order, name='order'), # 用户中心-订单页  增加分页功能
]