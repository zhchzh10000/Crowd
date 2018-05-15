# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CrowdFundProjects',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('name', models.CharField(max_length=255, verbose_name='项目名称')),
                ('remark', models.CharField(max_length=255, verbose_name='简介')),
                ('money', models.DecimalField(max_digits=10, verbose_name='众筹金额', decimal_places=2)),
                ('day', models.IntegerField(verbose_name='众筹天数')),
                ('status', models.SmallIntegerField(choices=[(0, '即将开始'), (1, '众筹中'), (2, '众筹成功'), (3, '众筹失败')], default=0, verbose_name='状态')),
                ('daploydate', models.DateField(verbose_name='开始日期')),
                ('supportmoney', models.DecimalField(max_digits=10, verbose_name='已筹资金', decimal_places=2)),
                ('supporter', models.IntegerField(verbose_name='投资人数')),
                ('follow_num', models.IntegerField(null=True, default=0, verbose_name='关注人数')),
                ('hand_image', models.ImageField(verbose_name='展示图片', upload_to='media/crowd/%Y%m')),
            ],
            options={
                'verbose_name_plural': '众筹项目表',
                'verbose_name': '众筹项目表',
                'db_table': 'crowfund_project',
            },
        ),
        migrations.CreateModel(
            name='DescImage',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('image', models.ImageField(verbose_name='详情图片', upload_to='media/crowd/%Y/%m')),
            ],
            options={
                'verbose_name_plural': '项目详情图片',
                'verbose_name': '项目详情图片',
                'db_table': 'crowd_image',
            },
        ),
        migrations.CreateModel(
            name='Follow',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('crowd', models.ForeignKey(to='crowd_project.CrowdFundProjects', verbose_name='项目')),
            ],
            options={
                'verbose_name_plural': '关注表',
                'verbose_name': '关注表',
            },
        ),
        migrations.CreateModel(
            name='ProType',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, verbose_name='ID', primary_key=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(verbose_name='修改时间', auto_now=True)),
                ('is_delete', models.BooleanField(default=False, verbose_name='标记删除')),
                ('name', models.CharField(max_length=20, verbose_name='类型名称')),
                ('desc', models.CharField(max_length=100, verbose_name='类型描述')),
            ],
            options={
                'verbose_name_plural': '项目类型表',
                'verbose_name': '项目类型表',
                'db_table': 'pro_type',
            },
        ),
    ]
