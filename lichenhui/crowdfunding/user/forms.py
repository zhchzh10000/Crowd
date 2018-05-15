from django import forms
from .models import IDPicture

class RegisterForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True,min_length=5)
    email = forms.EmailField(required=True)


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True,min_length=5)


class IDImageForm(forms.ModelForm):
    class Meta:
        model = IDPicture
        fields = ['pic']