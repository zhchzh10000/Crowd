from django import forms

class AddressForm(forms.Form):
    name = forms.CharField(required=True)  # username字段验证
    rev_phone = forms.CharField(required=True)
    address = forms.CharField(required=True)
