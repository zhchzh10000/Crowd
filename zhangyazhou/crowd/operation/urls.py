from django.conf.urls import url
from operation import views

urlpatterns = [
    url(r'^start_crowd/$',views.start_crowd,name='start_crowd'),
    url(r'^start_crowd1/$',views.start_crowd,name='start_crowd1'),
    url(r'^start_crowd2/$',views.start_crowd,name='start_crowd2'),
    url(r'^start_crowd3/$',views.start_crowd,name='start_crowd3'),
    url(r'^start_crowd4/$',views.start_crowd,name='start_crowd4'),
    url(r'^accttype/$',views.accttype,name='accttype'),
    url(r'^apply/$',views.apply,name='apply'),
    url(r'^apply1/$',views.Apply1View.as_view,name='apply1'),
    url(r'^apply2/$',views.Apply2View.as_view,name='apply2'),
    url(r'^apply3/(?P<email>.*)/$',views.Apply3View.as_view,name='apply3'),
]