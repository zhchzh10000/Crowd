# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-15 11:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operation', '0002_auto_20180515_1048'),
    ]

    operations = [
        migrations.AddField(
            model_name='repay',
            name='image',
            field=models.ImageField(default=1, upload_to='repay', verbose_name='回报图片'),
            preserve_default=False,
        ),
    ]
