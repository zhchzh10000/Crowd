#!usr/bin/even python

from django import forms


class FilesForm(forms.Form):
    project_head_img = forms.FileField(required=False)
    project_detail = forms.FileField(required=False)

class PhotoForm(forms.Form):
    explain = forms.FileField(required=False)
