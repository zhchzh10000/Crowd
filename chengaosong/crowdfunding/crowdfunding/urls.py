"""crowdfunding URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from django.conf.urls import url,include
from apps.PublicDisplay.views import IndexView,RegisterView,LoginView,\
    StartStepView,StartStep2View,StartStep3View,StartStep4View,\
    MineCrowFundingView,ListView,ProjectView,\
    PayStep1View,order,PayStep2View,payment,follow,StartView,\
    LogoutView
import xadmin
from crowdfunding.settings import MEDIA_ROOT
from django.views.static import serve
urlpatterns = [
    url('admin/', xadmin.site.urls),
    #首页
    url(r'^index/$',IndexView.as_view(),name='index'),
    #注册
    url(r'^register/',RegisterView.as_view(),name='register'),
    url(r'^register_handler/',RegisterView.as_view(),name='register_handler'),
    #登录
    url(r'^login/',LoginView.as_view(),name='login'),
    url(r'^login_handler/',LoginView.as_view(),name='login_handler'),

    url(r'^logout/',LogoutView.as_view(),name='logout'),
    #start
    url(r'^start/',StartView.as_view(),name='start'),
    #发起众筹
    url(r'^start_step/',StartStepView.as_view(),name='start_step'),
    url(r'^start_step_handler/',StartStepView.as_view(),name='start_step_handler'),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    #回报
    url(r'^start_step_2/',StartStep2View.as_view(),name='start_step_2'),
    url(r'^start_step_2_handler/(?P<project_id>\d+)/',StartStep2View.as_view(),name='start_step_2_handler'),
    #身份验证
    url(r'^start_step_3/',StartStep3View.as_view(),name='start_step_3'),
    url(r'^start_step_3_handler/',StartStep3View.as_view(),name='start_step_3_handler'),
    #完成众筹项目
    url(r'^start_step_4',StartStep4View.as_view(),name='start_step_4'),
    #我的众筹
    url(r'^minecrowfunding/',MineCrowFundingView.as_view(),name='minecrowfunding'),

    #列表页
    url(r'^list_projects/',ListView.as_view(),name='list_projects'),
    #详情页
    url(r'^project/(?P<project_id>\d+)',ProjectView.as_view(),name='project'),

    #订单
    url(r'^pay_step_1/(?P<order_id>\d+)',PayStep1View.as_view(),name='pay_step_1'),
    url(r'^order_add',order,name='order_add'),
    #订单2
    url(r'pay_step_2/(?P<order_id>\d+)',PayStep2View.as_view(),name='pay_step_2'),
    #添加地址
    url(r'^add_address/',PayStep2View.as_view(),name='add_address'),
    #订单提交
    url(r'^payment/',payment,name='payment'),
    #收藏
    url(r'^follow/',follow,name='follow')

]
