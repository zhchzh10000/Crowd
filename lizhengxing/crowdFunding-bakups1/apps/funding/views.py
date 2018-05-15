from django.shortcuts import render
from django.views.generic.base import View


class Minecrowdfunding(View):
    def get(self, request, user_id):
        print(user_id)
        return render(request, 'minecrowdfunding.html')