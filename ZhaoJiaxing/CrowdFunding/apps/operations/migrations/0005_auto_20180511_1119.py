# Generated by Django 2.0.5 on 2018-05-11 03:19

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('operations', '0004_emailverifyview'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmailVerifyCode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('send_time', models.DateTimeField(auto_now_add=True, verbose_name='发送时间')),
                ('verify_code', models.CharField(default=0, max_length=100, verbose_name='邮箱验证码')),
                ('code_type', models.CharField(choices=[('register', '注册'), ('forget', '忘记密码'), ('verify_id', '实名认证')], default='register', max_length=20, verbose_name='验证码类型')),
                ('user', models.ForeignKey(on_delete='cascade', to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name': '邮箱验证码',
                'verbose_name_plural': '邮箱验证码',
            },
        ),
        migrations.RemoveField(
            model_name='emailverifyview',
            name='user',
        ),
        migrations.DeleteModel(
            name='EmailVerifyView',
        ),
    ]
