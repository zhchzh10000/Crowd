from django.conf.urls import url
from .views import StartProView,ProjectInfoView,ProjectRepayView,AccountInfoView,CompleteProView

urlpatterns = [
    url(r'^startpro/$',StartProView.as_view(),name='startpro'),
    url(r'^projectinfo/$', ProjectInfoView.as_view(), name='projectinfo'),
    url(r'^projectrepay/$', ProjectRepayView.as_view(), name='projectrepay'),
    url(r'^projectaccount/$', AccountInfoView.as_view(), name='projectaccount'),
    url(r'^completepro/$', CompleteProView.as_view(), name='completepro'),

]