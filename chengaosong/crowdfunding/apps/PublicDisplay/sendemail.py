from apps.PublicDisplay.models import EmailVerifyRecord
from random import Random
from django.core.mail import send_mail
from crowdfunding.settings import EMAIL_FROM


# 生成随机字符串
def random_str(randomlength=8):
	str = ''
	chars = 'AaBbCcDdEeFfGg1234567890'
	length = len(chars) - 1
	random = Random()
	for i in range(randomlength):
		str += chars[random.randint(0, length)]
	return str


def send_register_email(email, send_type="register"):
	email_record = EmailVerifyRecord()
	code = random_str(16)
	email_record.code = code
	email_record.email = email
	email_record.send_type = send_type
	email_record.save()
	# 保存到数据库完成

	if send_type == 'register':
		email_title = "网站注册"
		email_body = "点击下面链接激活账号：<a href = 'http://127.0.0.1:8000/email/{0}+format(code)'>"+"'http://127.0.0.1:8000/email/{0}".format(code)+'</a>'
		send_mail(email_title, email_body, EMAIL_FROM, [email])
		send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
		if send_status:
			pass
	elif send_type == "forget":
		email_title = "众筹网注册密码重置链接"
		email_body = "请点击下面的链接重置密码: http://127.0.0.1:8000/reset/{0}".format(code)

		send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
		if send_status:
			pass