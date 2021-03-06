# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-05-14 13:47
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0006_auto_20180514_1943'),
    ]

    operations = [
        migrations.CreateModel(
            name='Return',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.IntegerField(choices=[(0, '实物回报'), (1, '虚拟物品回报')], default=0, verbose_name='回报类型')),
                ('support_money', models.IntegerField(default=0, verbose_name='支持金额')),
                ('content', models.CharField(max_length=200, verbose_name='回报内容')),
                ('img', models.ImageField(upload_to='project/return', verbose_name='回报说明图片')),
                ('return_num', models.IntegerField(default=0, verbose_name='回报数量')),
                ('limit_or_not', models.IntegerField(choices=[(0, '不限购'), (1, '限购')], default=0, verbose_name='是否限购')),
                ('one_order_limit', models.IntegerField(default=0, verbose_name='单笔限购数量')),
                ('trans_expenses', models.IntegerField(default=0, verbose_name='运费')),
                ('invoice', models.IntegerField(choices=[(0, '不开发票'), (1, '开发票')], default=0, verbose_name='是否开发票')),
                ('return_days', models.IntegerField(default=0, verbose_name='回报时间')),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.Project', verbose_name='所属项目')),
            ],
            options={
                'verbose_name': '回报信息',
                'verbose_name_plural': '回报信息',
                'db_table': 'return',
            },
        ),
    ]
