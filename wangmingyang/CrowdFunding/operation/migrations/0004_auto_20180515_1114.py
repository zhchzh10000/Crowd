# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-15 11:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operation', '0003_repay_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='repay',
            name='freight',
            field=models.IntegerField(choices=[(0, '包邮'), (1, '不包邮')], default=0, verbose_name='运费'),
        ),
    ]
