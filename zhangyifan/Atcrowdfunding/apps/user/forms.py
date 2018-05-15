from django import forms
from captcha.fields import CaptchaField
from .models import UserProfile

class LoginForm(forms.Form):
    username = forms.CharField(required=True)  # username字段验证
    password = forms.CharField(required=True)  # password字段验证
    # role = forms.CharField(required=True) #role字段验证


class RegisterForm(forms.Form):
    username = forms.CharField(required=True)
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    # customer_type = forms.CharField(required=True)
    # captcha = CaptchaField(error_messages={'invalid':'验证码错误!'})

#忘记密码
class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid":u"验证码错误"})


class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['customer_type', 'address', 'mobile', 'mobile']