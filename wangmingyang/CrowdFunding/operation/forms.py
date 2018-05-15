from django import forms
from projects.models import *


class ImageForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ['project_desc']

