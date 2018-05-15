from django import forms
class LoginForm(forms.Form):
    username = forms.CharField(required=True)  # username字段验证
    password = forms.CharField(required=True)  # password字段验证


class RegisterForm(forms.Form):
    username = forms.CharField(required=True)
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)

class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
