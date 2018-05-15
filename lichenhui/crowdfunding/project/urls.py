from django.conf.urls import url
from project.views import IndexView,ProjectInfoView,ProjectListView,StartProjectView,Step1View,Step2View,Step3View,Step4View

urlpatterns =[
    url(r'^index/$',IndexView.as_view(),name='index'),
    url(r'^info/(?P<project_id>\d+)/$',ProjectInfoView.as_view(),name='project_info'),
    url(r'^list/$',ProjectListView.as_view(),name='project_list'),
    url(r'^start/$',StartProjectView.as_view(),name='start_project'),
    url(r'^step1/$',Step1View.as_view(),name='step1'),
    url(r'^step2/$',Step2View.as_view(),name='step2'),
    url(r'^step3/$',Step3View.as_view(),name='step3'),
    url(r'^step4/$',Step4View.as_view(),name='step4'),
]