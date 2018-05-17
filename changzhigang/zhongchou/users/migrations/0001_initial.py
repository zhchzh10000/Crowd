# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User_Table',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(verbose_name='帐号', max_length='20')),
                ('password', models.CharField(verbose_name='密码', max_length=30)),
                ('email', models.EmailField(verbose_name='邮箱', max_length=20)),
                ('choice', models.SmallIntegerField(default=1, choices=[(1, '企业'), (0, '个人')])),
                ('Permissions', models.SmallIntegerField(default=1, choices=[(1, '会员'), (0, '管理')])),
                ('remember', models.BooleanField(default=False, verbose_name='记住密码')),
            ],
            options={
                'verbose_name': '注册',
                'verbose_name_plural': '注册',
            },
        ),
    ]
