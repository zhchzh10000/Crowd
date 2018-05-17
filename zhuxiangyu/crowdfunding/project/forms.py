from django import forms
from .models import ProjectInfo



class UploadImageForm(forms.ModelForm):
    class Meta:
        model = ProjectInfo
        fields = ['main_img','detail_img']