# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-12 01:18
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CompanyMsg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('name', models.CharField(max_length=50, verbose_name='公司名称')),
                ('desc', models.CharField(max_length=100, verbose_name='公司简介')),
                ('phone', models.CharField(max_length=20, verbose_name='公司电话')),
            ],
            options={
                'verbose_name': '公司信息',
                'verbose_name_plural': '公司信息',
            },
        ),
        migrations.CreateModel(
            name='EasyPay',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('accountion', models.IntegerField(verbose_name='易付宝账号')),
                ('card', models.CharField(max_length=30, verbose_name='法人身份证号码')),
                ('usermsg', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.UserMsg', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ProductMsg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('name', models.CharField(max_length=50, verbose_name='商品名称')),
                ('desc', models.CharField(max_length=100, verbose_name='商品介绍')),
                ('pro_sales', models.IntegerField(default=0, verbose_name='商品销量')),
                ('type', models.SmallIntegerField(choices=[(0, '科技'), (1, '设计'), (2, '公益'), (3, '农业'), (4, '文化')], default=0, verbose_name='商品类型')),
                ('mode', models.SmallIntegerField(choices=[(0, '即将众筹'), (1, '正在众筹'), (2, '众筹完成')], default=0, verbose_name='商品状态')),
                ('price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='商品价格')),
                ('prcie_back', models.DecimalField(decimal_places=2, default=0, max_digits=10, null=True, verbose_name='原始价格')),
                ('target_price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='目标金额')),
                ('reach_price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='达成金额')),
                ('one_num', models.IntegerField(default=0, null=True, verbose_name='一元人数')),
                ('support_num', models.IntegerField(default=0, verbose_name='达成人数')),
                ('target_num', models.IntegerField(default=200, verbose_name='目标人数')),
                ('fin_day', models.IntegerField(default=10, verbose_name='达成天数')),
                ('follow', models.IntegerField(default=0, verbose_name='关注人数')),
                ('tag', models.CharField(max_length=60, verbose_name='标签')),
                ('image', models.ImageField(upload_to='books', verbose_name='商品头图')),
                ('image_dec', models.ImageField(upload_to='books', verbose_name='商品详图')),
                ('company', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='product.CompanyMsg', verbose_name='公司名称')),
            ],
            options={
                'verbose_name': '商品信息',
                'verbose_name_plural': '商品信息',
            },
        ),
        migrations.CreateModel(
            name='ProFollow',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('fav_id', models.IntegerField(default=0, verbose_name='商品id')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.UserMsg', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ReProduct',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('supper_price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='支持金额')),
                ('retype', models.SmallIntegerField(choices=[(0, '实物回报'), (1, '虚拟物品回报')], default=0, verbose_name='回报类型')),
                ('recon', models.CharField(max_length=300, verbose_name='回报内容')),
                ('explainImage', models.ImageField(upload_to='books', verbose_name='说明图片')),
                ('re_num', models.IntegerField(default=0, verbose_name='回报数量')),
                ('num_type', models.IntegerField(default=0, verbose_name='限购类型')),
                ('buy_num', models.IntegerField(default=1, verbose_name='限购数量')),
                ('fare_price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='运费')),
                ('is_bill', models.SmallIntegerField(choices=[(0, '不开发票'), (1, '开发票')], default=0, verbose_name='是否发票')),
                ('re_day', models.IntegerField(default=10, verbose_name='达成天数')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.ProductMsg', verbose_name='商品')),
            ],
            options={
                'verbose_name': '回报信息',
                'verbose_name_plural': '回报信息',
            },
        ),
    ]
