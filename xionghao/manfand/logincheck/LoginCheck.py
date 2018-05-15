from django.shortcuts import redirect
from django.core.urlresolvers import reverse


def login_required(view_func):
    '''登录判断装饰器'''
    def wrapper(request, *view_args, **view_kwargs):
        try:

            if request.session._session['islogin']:
                # 用户已登录
                return view_func(request, *view_args, **view_kwargs)
        except:
            pass
            # 跳转到登录页面
            return redirect(reverse('log:login'))
    return wrapper