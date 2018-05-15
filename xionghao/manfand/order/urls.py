from django.conf.urls import url
from order import views
urlpatterns = [
    url(r'payone/(?P<pro_id>\d+)/(?P<price>\d+)$',views.OrderHtml.as_view(),name='payone'),
    url(r'paytwo/(?P<pro_id>\d+)/(?P<price>\d+)/(?P<count>\d+)$',views.OrderPay.as_view(),name='paytwo'),
    url(r'add/',views.appendAddress,name='add')
]