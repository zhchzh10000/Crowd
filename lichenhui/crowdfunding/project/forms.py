from django import forms

class ProjectForm(forms.Form):
    # 项目类型
    project_type = forms.CharField(required=True,error_messages={'required':'项目类型不能为空'})
    # 项目标签
    tag = forms.CharField(required=True,error_messages={'required':'请至少选择一个标签'})
    # 名称
    name = forms.CharField(min_length=5,required=True,error_messages={'required':'项目名称不能为空'})
    # 简介
    remark = forms.CharField(min_length=10,required=True,error_messages={'required':'简介不能为空'})
    # 目标
    target_money = forms.IntegerField(required=True,error_messages={'required':'目标金额不能为空'})
    # 天数
    period = forms.IntegerField(required=True,error_messages={'required':'天数不能为空'})
    # 头图
    project_cover = forms.ImageField(required=True,error_messages={'required':'头图不能为空'})
    # 详情图
    project_info = forms.ImageField(required=True,error_messages={'required':'详情图不能为空'})
    # 发起人一句话介绍
    a_word_intro = forms.CharField(min_length=5,required=True,error_messages={'required':'发起人简介字数不符合要求'})
    # 详细介绍
    self_intro = forms.Textarea()
    # 联系电话
    phone_number = forms.CharField(min_length=11,required=True,error_messages={'required':'联系电话不能为空'})
    # 客服电话
    service_number = forms.CharField(min_length=11, required=True,error_messages={'required':'客服电话不能为空'})


class ReturnForm(forms.Form):
    # 回报类型
    type = forms.IntegerField(required=True,error_messages={'required':'请选择回报类型'})
    # 支持金额
    support_money = forms.IntegerField(required=True,error_messages={'required':'支付金额不能为空'})
    # 回报内容
    content = forms.CharField(required=True,error_messages={'required':'回报内容不能为空'})
    # 说明图片
    img = forms.ImageField(required=True,error_messages={'required':'说明图片不能为空'})
    # 回报数量
    return_num = forms.IntegerField(required=True,error_messages={'required':'回报数量不能为空'})
    # 是否限购
    limit_or_not = forms.IntegerField(required=True,error_messages={'required':'请选择是否限购'})
    # 限购数量
    # one_order_limit = forms.IntegerField(required=False,error_messages={'required':'若限购需要填写限购数量'})
    # 运费
    trans_expenses = forms.IntegerField(required=True,error_messages={'required':'请填写运费，若包邮填写0'})
    # 是否开发票
    invoice = forms.IntegerField(required=True,error_messages={'required':'请选择是否可以开发票'})
    # 回报时间
    return_days = forms.IntegerField(required=True,error_messages={'required':'回报时间不能为空'})


