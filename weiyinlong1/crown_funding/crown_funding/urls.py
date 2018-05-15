"""crown_funding URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve
from django.conf import settings
# from store.views import prodetail
from store.views import *

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^users/',include('users.urls',namespace='users')),
    url(r'^media/(?P<path>.*)$',serve,{'document_root':settings.MEDIA_ROOT}),
    url(r'^tinymce/',include('tinymce.urls')),
    url(r'^store/',include('store.urls',namespace='store')),
    url(r'^startpro/',include('startpro.urls',namespace='startpro')),


]
