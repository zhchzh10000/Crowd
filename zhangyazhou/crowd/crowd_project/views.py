from django.db.models import Q
from django.shortcuts import render,redirect
from django.core.urlresolvers import reverse
from users.models import Member
from crowd_project.models import CrowdFundProjects,ProType,Follow
from django.http import JsonResponse
# Create your views here.

import datetime

def index(request):
    # 项目列表
    new_type_list = []
    new_pro_list = {}
    other_type_list = []
    crowd_list = CrowdFundProjects.objects.all()
    protype_list = ProType.objects.all()
    for i,pro_type in enumerate(protype_list):
        if i < 3:
            new_type_list.append(pro_type)
            pro_list = crowd_list.filter(pro_type__id=pro_type.id)[:4]
            new_pro_list[pro_type.id] = pro_list
        else:
            other_type_list.append(pro_type)

    # 顶部推荐位
    hot_list = crowd_list.order_by('-supporter')[:3]

    other_list = crowd_list.exclude(pro_type_id__in=other_type_list)[:4]
    content = {
        'hot_list': hot_list,
        'other_list': other_list,
        'new_type_list':new_type_list,
        'new_pro_list':new_pro_list

    }
    return render(request,'crowd_project/index.html', context=content)


def project_list(request):

    content = {
    }
    return render(request,'crowd_project/projects.html',context=content)


def detail(request,pro_id):
    member_id = request.session.get('member_id')
    try:
        fol = Follow.objects.filter(member_id=member_id,crowd_id=pro_id)
        if fol:
            status = 'true'
        else:
            status = 'false'
    except Exception:
        status = 'false'

    try:
        pro = CrowdFundProjects.objects.get(id=pro_id)
        content = {
            'pro': pro,
            'status':status
        }
        return render(request, 'crowd_project/project.html', context=content)
    except Exception:
        errmsg = '商品暂时找不到，请先浏览其他商品'
        content = {
            'errmsg': errmsg,
        }
        return render(request, 'crowd_project/project.html', context=content)


def follow(request):
    pro_id = request.POST.get('pro_id')
    member_id = request.session.get('member_id')
    follow_status =request.POST.get('follow_status')

    try:
        crowd = CrowdFundProjects.objects.get(id=pro_id)
        if follow_status == 'false':
            fol = Follow(member_id=member_id, crowd_id=pro_id)
            fol.save()
            crowd.follow_num += 1
            crowd.save()
            msg = '<i style="color:#f60" class="glyphicon glyphicon-heart"></i> 已关注' + str(crowd.follow_num)
            return JsonResponse({'res': 200, 'msg': msg})
        elif follow_status == 'true':
            fol = Follow.objects.filter(member_id=member_id, crowd_id=pro_id)
            fol.delete()
            crowd.follow_num -= 1
            crowd.save()
            msg = '<i style="color:#f60" class="glyphicon glyphicon-heart"></i> 关注' + str(crowd.follow_num)
            return JsonResponse({'res': 200, 'msg': msg})
    except Exception:
        return JsonResponse({'res': 400})
