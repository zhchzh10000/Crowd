from random import Random
from django.core.mail import send_mail
from .models import EmailVerifyRecord
from crowdfunding.settings import EMAIL_FROM


# 生成一个随机字符串（作为验证码）
def random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    return str


# 发送邮件
def send_email(email, send_type="register"):
    # 实例化一个邮箱验证记录
    email_record = EmailVerifyRecord()
    if send_type == "authenticate":
        code = random_str(4)
    else:
        code = random_str(16)
    # 给各个字段赋值（验证码，邮箱，验证类型）
    email_record.code = code
    email_record.email = email
    email_record.verify_type = send_type
    email_record.save()

    email_title = ""
    email_body = ""

    if send_type == "register":
        email_title = "硅谷在线网注册激活链接"
        email_body = "请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/{0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "硅谷在线网注册密码重置链接"
        email_body = "请点击下面的链接重置密码: http://127.0.0.1:8000/reset/{0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "authenticate":
        email_title = "尚筹网实名认证验证"
        email_body = "你的邮箱验证码为: {0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass


