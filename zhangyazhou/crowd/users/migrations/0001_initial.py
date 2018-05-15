# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.auth.models
import django.utils.timezone
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='StaffUser',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(help_text='Designates that this user has all permissions without explicitly assigning them.', default=False, verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', unique=True, validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username. This value may contain only letters, numbers and @/./+/-/_ characters.', 'invalid')], max_length=30, verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(help_text='Designates whether the user can log into this admin site.', default=False, verbose_name='staff status')),
                ('is_active', models.BooleanField(help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', default=True, verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('login_acct', models.CharField(blank=True, null=True, max_length=255, default='', verbose_name='登录地址')),
                ('phone', models.IntegerField(blank=True, null=True, verbose_name='电话')),
                ('groups', models.ManyToManyField(help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', blank=True, verbose_name='groups', to='auth.Group', related_query_name='user')),
                ('user_permissions', models.ManyToManyField(help_text='Specific permissions for this user.', related_name='user_set', blank=True, verbose_name='user permissions', to='auth.Permission', related_query_name='user')),
            ],
            options={
                'verbose_name_plural': '员工表',
                'verbose_name': '员工表',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('login_acct', models.CharField(max_length=255, verbose_name='登录地址')),
                ('password', models.CharField(max_length=140, verbose_name='密码')),
                ('username', models.CharField(max_length=100, verbose_name='用户名')),
                ('email', models.EmailField(max_length=50, verbose_name='邮箱')),
                ('user_status', models.SmallIntegerField(choices=[(0, '未实名认证'), (1, '实名认证申请中'), (2, '已实名认证')], default=0, verbose_name='实名状态')),
            ],
            options={
                'verbose_name_plural': '会员表',
                'verbose_name': '会员表',
                'permissions': (('create_crowd_fund', '发起众筹'),),
            },
        ),
        migrations.CreateModel(
            name='RealName',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('realname', models.CharField(max_length=100, verbose_name='真实姓名')),
                ('cardnum', models.CharField(max_length=20, verbose_name='身份证号')),
                ('phone', models.IntegerField(verbose_name='手机号码')),
                ('serphone', models.IntegerField(verbose_name='客服电话')),
                ('introduce', models.CharField(max_length=300, verbose_name='介绍')),
                ('hand_image', models.ImageField(verbose_name='头像', upload_to='media/user/%Y/%m')),
                ('one_self', models.CharField(max_length=50, verbose_name='自我介绍')),
                ('self_desc', models.CharField(max_length=200, verbose_name='详细自我介绍')),
                ('user_type', models.CharField(choices=[('gr', '个人'), ('gs', '公司'), ('gt', '个体'), ('gf', '政府')], max_length=5, default=0)),
                ('member', models.ForeignKey(to='users.Member', verbose_name='会员')),
            ],
            options={
                'verbose_name_plural': '实名认证表',
                'verbose_name': '实名认证表',
            },
        ),
    ]
