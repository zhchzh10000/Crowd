from django.conf.urls import url
from .views import CreateOrderView,ConfirmOrderView

urlpatterns = [
    url(r'^createorder/(?P<repay_id>\d+)/$',CreateOrderView.as_view(),name='createorder'),
    # 创建订单信息时，前端的post页面无法跟repay_id,创建一个新的路由???????
    url(r'^createorder/$', CreateOrderView.as_view(),),
    url(r'^confirmorder/$', ConfirmOrderView.as_view(), name='confirmorder'),

]