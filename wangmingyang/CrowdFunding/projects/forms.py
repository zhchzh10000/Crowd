from django import forms
from projects.models import *


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ['project_title','project_desc']


