# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-11 09:06
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_auto_20180511_0746'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usercertify',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='认证的用户'),
        ),
        migrations.AlterField(
            model_name='usercertify',
            name='usercertify_type',
            field=models.CharField(choices=[('PersonalManagement', '个人经营'), ('BusinessCompany', '商业公司'), ('IndividualIndustryAndCommerce', '个体工商户'), ('GovernmentAndNoprofitOrganizations', '政府及非营利组织')], max_length=100, verbose_name='实名认证账户类型'),
        ),
    ]