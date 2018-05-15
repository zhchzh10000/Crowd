from django.conf.urls import url
from .views import Detail,Projects,Order,Pay,Start,Step_a,Step_b,Step_c,Step_d

urlpatterns = [

    url(r'^detail/(?P<project_id>\d+)$', Detail.as_view(), name='detail'),  # 詳情頁
    url(r'^pros/$', Projects.as_view(), name='pros'),  # 列表頁
    url(r'^pay/', Order.as_view(), name='pay_a'),  # 支付1
    url(r'^pay_b/', Pay.as_view(), name='pay_b'),  # 支付2
    url(r'^start/', Start.as_view(), name='start'),  # 发起众筹
    url(r'^step_a/', Step_a.as_view(), name='step_a'),  # 发起众筹a
    url(r'^step_b/', Step_b.as_view(), name='step_b'),  # 发起众筹b
    url(r'^step_c/', Step_c.as_view(), name='step_c'),  # 发起众筹c
    url(r'^step_d/', Step_d.as_view(), name='step_d'),  # 发起众筹d

]