from django import forms


class LoginForm(forms.Form):
    name = forms.CharField(required=True)  # username字段验证
    password = forms.CharField(required=True)  # password字段验证

class RegisterForm(forms.Form):
    name = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
    email = forms.EmailField(required=True)