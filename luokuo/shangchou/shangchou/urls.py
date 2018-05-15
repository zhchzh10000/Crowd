"""shangchou URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.views.generic import TemplateView

from operation.views import Start_Crowdfunding, Start_Step1, Start_Step2, Start_Step3, Start_Step4
from order.views import Pay_One_View, Pay_Two_View
from project.views import ProList, ProView, IndexView
from user.views import UserLogin, RegisterView, LogoutView, UserCenter, Mine, Accttype, Apply, Apply1, Apply2, \
	Apply3
from django.views.static import serve
from .settings import MEDIA_ROOT
import xadmin

from user import views

urlpatterns = [
	url(r'^admin/', xadmin.site.urls),
	url(r'^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),
	url(r'^$', IndexView.as_view(), name="index"),
	url('^login/', UserLogin.as_view(), name='login'),
	url('^reg/', RegisterView.as_view(), name='reg'),
	url(r'^captcha/', include('captcha.urls')),
	# url(r'^user/', include('user.urls', namespace='users')),
	url(r'^logout/$', LogoutView.as_view(), name='logout'),
	url(r'^project/$', ProList.as_view(), name='projects'),
	url(r'^pro/(?P<pro_id>\d+)/$', ProView.as_view(), name='pro'),
	url(r'^paystep1/$', Pay_One_View.as_view(), name='pay1'),
	url(r'^paystep2/$', Pay_Two_View.as_view(), name='pay2'),
	url(r'^usercenter/$', UserCenter.as_view(), name='usercenter'),
	url(r'^mine/$', Mine.as_view(), name='mine'),

	url(r'^accttype/$', Accttype.as_view(), name='accttype'),
	url(r'^apply/$', Apply.as_view(), name='apply'),
	url(r'^apply1/$', Apply1.as_view(), name='apply1'),
	url(r'^apply2/$', Apply2.as_view(), name='apply2'),
	url(r'^apply3/$', Apply3.as_view(), name='apply3'),
	# 发起众筹
	url(r'^start/$', Start_Crowdfunding.as_view(), name='start'),
	url(r'^step1/$', Start_Step1.as_view(), name='step1'),
	url(r'^step2/$', Start_Step2.as_view(), name='step2'),
	url(r'^step3/$', Start_Step3.as_view(), name='step3'),
	url(r'^step4/$', Start_Step4.as_view(), name='step4'),

]
