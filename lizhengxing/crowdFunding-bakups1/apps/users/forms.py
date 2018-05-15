from django import forms

# 注册
class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=4)

#登录
class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True)

class UploadForm(forms.Form):
    image = forms.FileField(required=False)
    infoimage =forms.FileField(required=False)