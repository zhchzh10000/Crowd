from django.conf.urls import url
from users import views


urlpatterns = [
    url(r'login/$', views.LoginView.as_view(), name='login'),
    url(r'register/$', views.RegisterView.as_view(), name='register'),
    url(r'core/$',views.member_core,name='core'),
    url(r'min_crowd/$',views.min_crowd,name='min_crowd'),
]