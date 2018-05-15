from django.conf.urls import url
from .views import ProjectDetailView,ProjectListView,AddFavView



urlpatterns = [
    url(r'^project_detail/(?P<project_id>\d+)/$',ProjectDetailView.as_view(),name='project_detail'),
    url(r'^project_list/$', ProjectListView.as_view(), name='project_list'),
    # 点击设置关注和数量
    url(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),

]