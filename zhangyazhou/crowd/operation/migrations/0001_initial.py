# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='VerificationCode',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('code', models.CharField(max_length=24, verbose_name='验证码')),
                ('code_type', models.CharField(choices=[('zc', '注册'), ('smrz', '实名认证'), ('xgmm', '修改密码')], max_length=10, verbose_name='验证码类型')),
            ],
            options={
                'verbose_name': '验证码表',
            },
        ),
    ]
