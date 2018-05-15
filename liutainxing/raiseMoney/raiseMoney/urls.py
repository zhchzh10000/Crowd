"""raiseMoney URL Configuration

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
import xadmin
from django.conf.urls import url, include
from django.contrib import admin
from django.views.static import serve
from user.views import IndexView
from raiseMoney.settings import MEDIA_ROOT
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^index/', IndexView.as_view(),name='index'),


    url(r'^user/', include('user.urls',namespace='user')),
    url(r'xadmin/', include(xadmin.site.urls)),
    url(r'^pro/', include('projects.urls',namespace='projects')),
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^media/(?P<path>.*)$',serve,{"document_root":MEDIA_ROOT}),
]







