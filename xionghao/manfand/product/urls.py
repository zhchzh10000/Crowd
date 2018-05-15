from django.conf.urls import url
from product import views
urlpatterns = [
    url(r'index/$',views.Index.as_view(),name='index'),
    url(r'projects/$',views.ProductsList.as_view(),name='projects'),
    url(r'project/(?P<pro_id>\d+)$',views.ProductDe.as_view(),name='project'),
    url(r'follow/$',views.Follow.as_view(),name='follow'),
    url(r'start/$',views.StartPro.as_view(),name='start'),
    url(r'next/$',views.NextPro.as_view(),name='next'),
    url(r'next2/$',views.NextProOther.as_view(),name='next2'),
    url(r'finally/$',views.Finally.as_view(),name='finally'),
]