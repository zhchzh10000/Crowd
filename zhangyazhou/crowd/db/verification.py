from django.shortcuts import redirect
from django.core.urlresolvers import reverse


def login_check(fun):
    def wopper(request,*args):
        if request.session.get('islogin',False):
            fun(request,*args)
        else:
            return redirect(reverse('crowd:index'))
    return wopper
