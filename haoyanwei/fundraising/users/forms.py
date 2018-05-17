#!usr/bin/even python

from django import forms

from .models import User

class LoginForm(forms.Form):
    username = forms.CharField(required=True)  # username字段验证
    password = forms.CharField(required=True)  # password字段验证



class RegisterForm(forms.Form):
    username = forms.CharField(required=True)  # username字段验证
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)# password字段验证



