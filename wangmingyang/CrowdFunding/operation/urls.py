from operation.views import *
from django.conf.urls import url
urlpatterns = [
    url(r'^$',AccttypeView.as_view(),name='accttype'),
    ]
