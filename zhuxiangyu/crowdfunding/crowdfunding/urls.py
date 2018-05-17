"""crowdfunding URL Configuration

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
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from user.views import IndexView

from django.views.static import serve
from . import settings



urlpatterns = [
    url(r'^admin/', admin.site.urls),
    #首页路由必须'^$'，不然都匹配错误
    url(r'^$',IndexView.as_view(),name='index'),
    
    url(r'^user/',include('user.urls',namespace='user')),
    url(r'^project/', include('project.urls', namespace='project')),
    url(r'^startpro/', include('startpro.urls', namespace='startpro')),
    url(r'^order/', include('order.urls', namespace='order')),
    
    #静态文件路径,只需要在主应用的路由中配置就可以
    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT})

]