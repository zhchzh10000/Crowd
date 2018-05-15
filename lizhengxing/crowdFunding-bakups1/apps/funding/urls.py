from django.conf.urls import url
from funding.views import Minecrowdfunding
urlpatterns = [

    url(r'^minecrowdfunding/(?P<user_id>\d+)/$', Minecrowdfunding.as_view(), name='minecrowdfunding'),#我的众筹

]