# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-05-15 01:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0007_return'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tag',
            name='project',
        ),
        migrations.AddField(
            model_name='project',
            name='tag',
            field=models.CharField(default='tag', max_length=5, verbose_name='项目标签'),
        ),
        migrations.AlterField(
            model_name='return',
            name='invoice',
            field=models.IntegerField(choices=[(0, '不可开发票'), (1, '开发票')], default=0, verbose_name='是否开发票'),
        ),
    ]
