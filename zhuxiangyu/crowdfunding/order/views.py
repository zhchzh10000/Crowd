from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.core.urlresolvers import reverse
from django.http import HttpResponse, JsonResponse
from project.models import RepayInfo
from order.models import OrderInfo
from datetime import datetime
from user.models import UserAddress

'''
创建订单信息
'''
class CreateOrderView(View):
    def get(self, request, repay_id):
        repayinfo = RepayInfo.objects.get(id=repay_id)
        project = repayinfo.project
        context = {
            'repayinfo':repayinfo,
            'project':project,
        }
        return render(request, 'order/pay-step-1.html', context=context)
    
    def post(self,request):
        data = dict()
        repay_count = request.POST.get('repay_count', '')
        freight = request.POST.get('freight', '')
        total_price = int(request.POST.get('total_price', ''))
        repayinfo_id = int(request.POST.get('repayinfo_id', ''))

        # 组织订单信息
        user_id = request.user.id
        # 订单id: 20171029110830+用户的id
        order_id = datetime.now().strftime('%Y%m%d%H%M%S') + str(user_id)
        # 如果回头修改数量的话，会创建新的订单，那么原来的订单怎么办？？？？？？？？？？？？？？？？？？
        # 实现修改订单的操作？？？？？？？？？？？？？？？？？？？？？？
        orderinfo = OrderInfo.objects.create(
            order_id=order_id,repay_count=repay_count,freight=freight,
            total_price=total_price,repayinfo_id=repayinfo_id,user=request.user,
        )
        request.session['order_id'] = order_id
        # 这种信息应该存放在redis中，否则对数据库的压力比较大，那么，参阅书城的实现方式？？？？？？？？？？？
        # 在session中创建此条信息之后，是否需要删除，否则在创建下一个订单会不会读取错误？？？？？？？？？？？？？？？？？
        print('创建订单成功')
        data['res'] = 200
        return JsonResponse(data)

'''
确认订单信息
'''
class ConfirmOrderView(View):
    def get(self, request,):
        address = UserAddress.objects.filter(user=request.user)
        order_id = request.session['order_id']
        orderinfo = OrderInfo.objects.get(order_id=order_id)
        repayinfo = RepayInfo.objects.get(id=orderinfo.repayinfo_id)
        project = repayinfo.project
        context = {
            'address':address,
            'orderinfo':orderinfo,
            'repayinfo':repayinfo,
            'project':project,
        }
        return render(request, 'order/pay-step-2.html', context=context)
    
    def post(self,request):
        data = dict()
        address_id = request.POST.get('address_id', '')
        need_receipt = request.POST.get('need_receipt', '')
        receipt_head = request.POST.get('receipt_head', '')
        pay_price = request.POST.get('pay_price', '')
        remarks = request.POST.get('remarks', '')
        
        order_id = request.session['order_id']
        orderinfo = OrderInfo.objects.get(order_id=order_id)
        orderinfo.address_id = address_id
        orderinfo.need_receipt = need_receipt
        orderinfo.receipt_head =receipt_head
        orderinfo.pay_price = pay_price
        orderinfo.remarks = remarks
        # orderinfo.createtime = datetime.now
        orderinfo.save()
        
        # 每一笔订单添加一个项目支持人数
        repayinfo = orderinfo.repayinfo
        project = repayinfo.project
        print('project.support_people-----------',project.support_people)
        project.support_people = project.support_people + 1
        # 每一笔订单产生的金额加入到众筹的金额中
        project.raised_money += orderinfo.total_price
        project.save()
        print('project.support_people-----------++++',project.support_people)
        
        data['res'] = 200
        return JsonResponse(data)