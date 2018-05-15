__author__ = 'zhang'
__date__ = '2018/5/9 14:32'

from django import forms
from users.models import UserProfile


#注册表单
class RegisterForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=3)
    email = forms.EmailField(required=True)


#登录验证表单
class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True)


class UploadForm(forms.Form):
    image_head = forms.CharField(required=False)
    image_body = forms.CharField(required=False)


class ImageForm(forms.Form):
    upload_image = forms.CharField(required=True)



