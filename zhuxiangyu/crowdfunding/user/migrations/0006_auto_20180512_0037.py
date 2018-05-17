# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-11 16:37
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0005_auto_20180511_0906'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserAddress',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('receiver', models.CharField(default='', max_length=50, verbose_name='收件人')),
                ('phone', models.CharField(default='', max_length=11, verbose_name='收件电话')),
                ('address', models.CharField(default='', max_length=200, verbose_name='收货地址')),
                ('user', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='认证的用户')),
            ],
            options={
                'verbose_name': '用户收件地址',
                'verbose_name_plural': '用户收件地址',
            },
        ),
        migrations.AlterField(
            model_name='usercertify',
            name='usercertify_type',
            field=models.CharField(choices=[('BusinessCompany', '商业公司'), ('IndividualIndustryAndCommerce', '个体工商户'), ('GovernmentAndNoprofitOrganizations', '政府及非营利组织'), ('PersonalManagement', '个人经营')], max_length=100, verbose_name='实名认证账户类型'),
        ),
    ]
