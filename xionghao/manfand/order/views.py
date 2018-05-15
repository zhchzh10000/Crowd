from django.shortcuts import render
from django.views.generic import View
from product.models import ProductMsg,ReProduct
from users.models import UserMsg
from logincheck.LoginCheck import login_required
from django.conf import settings
import os
from django.utils.decorators import method_decorator
from order.models import OrderAdress
from django.http import JsonResponse,HttpResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.


class OrderHtml(View):
    # @method_decorator(login_required)
    def get(self,request,pro_id,price):
        product = ProductMsg.objects.get(id=pro_id)
        if int(price) ==2:
            price = product.price
        elif int(price) ==1:
            price = 1.00
        company = product.company
        reproduct = ReProduct.objects.filter(product=product)
        if reproduct:
            reproduct = reproduct[0]
        return render(request,'html/pay-step-1.html',{'product':product,
                                                      'company':company,
                                                      'reproduct':reproduct,
                                                      'price':price,
                                                      })
class OrderPay(View):
    def get(self,request,pro_id,price,count):
        product = ProductMsg.objects.get(id=pro_id)
        company = product.company
        reproduct = ReProduct.objects.filter(product=product)[0]
        user_address = []
        try:
            user_id = request.session._session['user_id']
        except:
            user_id = None
        if user_id:
            user = UserMsg.objects.get(id=user_id)
            address = OrderAdress.objects.filter(user=user).order_by('-update_time')
            if address:
                if len(address) > 1:
                    user_address = address[:2]
                else:
                    user_address = address[:1]
        return render(request, 'html/pay-step-2.html', {'product': product,
                                                        'company': company,
                                                        'reproduct': reproduct,
                                                        'price': price,
                                                        'user_address': user_address,
                                                        'count': count,
                                                        })

@csrf_exempt
def appendAddress(request):
    try:
        user_id = request.session._session['user_id']
    except:
        return JsonResponse({'res':0})
    name = request.POST.get('rev_name')
    rev_phone = request.POST.get('rev_phone')
    address = request.POST.get('rev_address')
    order_address = OrderAdress()
    if not all([name,rev_phone,address,order_address]):
        return JsonResponse({'res': 2})
    if len(name)>30:
        return JsonResponse({'res': 3})
    if len(rev_phone)<5 or len(rev_phone)>11:
        return JsonResponse({'res': 4})
    try:
        user = UserMsg.objects.get(id=user_id)
    except:
        user = None
    if user:
        order_address.user_id = user_id
        order_address.rev_adress = address
        order_address.rev_person = name
        order_address.rev_phone = rev_phone
        order_address.save()
        return JsonResponse({'res':1})
    return JsonResponse({'res': 0})


