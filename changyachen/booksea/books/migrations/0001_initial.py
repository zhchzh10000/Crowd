# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Books',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('type_id', models.SmallIntegerField(verbose_name='商品种类', default=1, choices=[(1, 'Python'), (2, 'Javascript'), (3, '数据结构与算法'), (4, '操作系统'), (5, '机器学习'), (6, '数据库')])),
                ('name', models.CharField(max_length=20, verbose_name='商品名称')),
                ('desc', models.CharField(max_length=128, verbose_name='商品简介')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='商品价格')),
                ('unit', models.CharField(max_length=20, verbose_name='商品单位')),
                ('stock', models.IntegerField(default=1, verbose_name='商品库存')),
                ('sales', models.IntegerField(default=0, verbose_name='商品销量')),
                ('detail', tinymce.models.HTMLField(verbose_name='商品详情')),
                ('image', models.ImageField(upload_to='books', verbose_name='商品图片')),
                ('status', models.SmallIntegerField(verbose_name='商品状态', default=1, choices=[(0, '下线'), (1, '上线')])),
            ],
            options={
                'db_table': 's_books',
            },
        ),
    ]
