from django.conf.urls import url
from users import views

urlpatterns = [


	url(r'^register/$',views.register,name='register'),
	url(r'^login/$',views.login,name='login'),
	url(r'^active/(P<active_code>.*)',views.active,name='active'),
	url(r'^login_check/$',views.login_check,name='login_check'),
	url(r'logout/$',views.logout,name='logout'),
	url(r'Banner/$',views.Banner,name='Banner'),
	# url(r'projects/$',views.projects,name='projects'),
	# url(r'start/$',views.start,name='start'),
	# url(r'minecrowdfunding/$',views.minecrowdfunding,name='minecrowdfunding')
	#

]