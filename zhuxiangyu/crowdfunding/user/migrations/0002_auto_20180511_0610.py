# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-11 06:10
from __future__ import unicode_literals

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmailVerifyRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=20, verbose_name='验证码')),
                ('email', models.EmailField(max_length=50, verbose_name='邮箱')),
                ('code_type', models.CharField(choices=[('register', '注册'), ('forget', '找回密码'), ('update_email', '修改邮箱'), ('realname_certify', '实名认证')], max_length=30, verbose_name='验证码类型')),
                ('send_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='发送时间')),
            ],
            options={
                'verbose_name': '邮箱验证码',
                'verbose_name_plural': '邮箱验证码',
            },
        ),
        migrations.CreateModel(
            name='UserCertify',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('usercertify_type', models.CharField(choices=[('BusinessCompany', '商业公司'), ('IndividualIndustryAndCommerce', '个体工商户'), ('PersonalManagement', '个人经营'), ('GovernmentAndNoprofitOrganizations', '政府及非营利组织')], max_length=100, verbose_name='实名认证账户类型')),
                ('realname_certify', models.CharField(choices=[('0', '未实名认证'), ('1', '已实名认证')], default=0, max_length=10, verbose_name='用户实名认证')),
                ('realname', models.CharField(max_length=50, verbose_name='用户真实姓名')),
                ('id_card', models.CharField(max_length=18, verbose_name='用户身份证号')),
                ('mobile', models.CharField(blank=True, max_length=11, null=True, verbose_name='手机号')),
                ('idcard_handler_img', models.ImageField(default='idcard_handler_img/default.png', upload_to='idcard_handler_img/%Y/%m', verbose_name='手持身份证照片')),
            ],
            options={
                'verbose_name': '用户认证信息',
                'verbose_name_plural': '用户认证信息',
            },
        ),
        migrations.RemoveField(
            model_name='userprofile',
            name='mobile',
        ),
        migrations.AddField(
            model_name='usercertify',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='认证的用户'),
        ),
    ]
