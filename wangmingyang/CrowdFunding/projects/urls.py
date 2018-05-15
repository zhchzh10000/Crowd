from projects.views import *
from django.conf.urls import url
urlpatterns = [
    url(r'^list/$',ProjectListView.as_view(),name='list'),
    url(r'^start/$', StartView.as_view(), name='start'),
    url(r'^step1/$', Step1View.as_view(), name='step1'),
    url(r'^step2/$', Step2View.as_view(), name='step2'),
    url(r'^step3/$', Step3View.as_view(), name='step3'),
    url(r'^step4/$', Step4View.as_view(), name='step4'),
    url(r'^detail/(?P<project_id>\d+)/$$', ProjectDetailView.as_view(), name='detail'),
    ]
