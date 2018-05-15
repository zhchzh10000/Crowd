from .models import Member
from django import forms

class RegisterForm(forms.Form):

	username = forms.CharField(required=True)
	password = forms.CharField(required=True)
	email = forms.EmailField(required=True)


class LoginFrom(forms.Form):
	username = forms.CharField(required=True)
	password = forms.CharField(required=True)

class UploadFileForm(forms.Form):
	head_img = forms.FileField(required=False)
	detail_img = forms.FileField(required=False)

class UploadFileForm2(forms.Form):
	explain = forms.FileField(required=False)