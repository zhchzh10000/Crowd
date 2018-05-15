# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-14 10:01
from __future__ import unicode_literals

import datetime
from django.conf import settings
import django.contrib.auth.models
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0007_alter_validators_add_error_messages'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmailVerifyRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=20, verbose_name='验证码')),
                ('email', models.EmailField(max_length=50, verbose_name='邮箱')),
                ('send_type', models.CharField(choices=[('register', '注册'), ('forget', '找回密码')], max_length=15)),
                ('send_time', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'verbose_name': '邮箱验证码',
                'verbose_name_plural': '邮箱验证码',
            },
        ),
        migrations.CreateModel(
            name='Follower',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'verbose_name': '关注表',
                'verbose_name_plural': '关注表',
            },
        ),
        migrations.CreateModel(
            name='MemberAddress',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.CharField(max_length=255, verbose_name='地址')),
            ],
            options={
                'verbose_name': '会员地址表',
                'verbose_name_plural': '会员地址表',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_id', models.CharField(max_length=255, verbose_name='订单号')),
                ('order_num', models.CharField(max_length=255, verbose_name='订单数量')),
                ('create_date', models.DateTimeField(default=datetime.datetime.now, verbose_name='创建时间')),
                ('money', models.IntegerField(verbose_name='价格')),
                ('rtncount', models.IntegerField(verbose_name='返回数量')),
                ('status', models.CharField(choices=[('0', '待付款'), ('1', '交易完成'), ('9', '交易关闭')], max_length=1, verbose_name='状态')),
                ('address', models.CharField(max_length=255, verbose_name='地址')),
                ('invoice', models.CharField(choices=[('0', '不开发票'), ('1', '开发票')], max_length=1, verbose_name='发票')),
                ('invoictitle', models.CharField(max_length=255, verbose_name='发票抬头')),
                ('remark', models.CharField(max_length=255, verbose_name='备注')),
            ],
            options={
                'verbose_name': '订单',
                'verbose_name_plural': '订单',
            },
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='项目名称')),
                ('remark', models.CharField(max_length=255, verbose_name='简介')),
                ('money', models.BigIntegerField(verbose_name='筹资金额（元）')),
                ('day', models.IntegerField(verbose_name='筹资天数(天)')),
                ('status', models.CharField(choices=[('0', '即将开始'), ('1', '众筹中'), ('2', '众筹成功'), ('3', '众筹失败')], default='0', max_length=20, verbose_name='众筹状态')),
                ('deploydate', models.DateTimeField(default=datetime.datetime.now, verbose_name='部署日期')),
                ('supportmoney', models.BigIntegerField(default=0, verbose_name='支持资金')),
                ('completion', models.CharField(choices=[('0', '未完成'), ('1', '已完成')], default='0', max_length=1, verbose_name='是否完成')),
                ('createdate', models.DateTimeField(default=datetime.datetime.now, verbose_name='创建时间')),
                ('project_head_img', models.ImageField(upload_to='head_img/%Y/%m', verbose_name='项目头图')),
                ('project_detail', models.ImageField(upload_to='detail/%Y/%m', verbose_name='项目详情')),
                ('Follower_nums', models.IntegerField(default=0, verbose_name='关注数')),
                ('support_nums', models.IntegerField(default=0, verbose_name='支持数')),
                ('show', models.CharField(blank=True, max_length=255, null=True, verbose_name='自我介绍')),
                ('detail_show', models.TextField(blank=True, null=True, verbose_name='详细自我介绍')),
                ('phone', models.CharField(blank=True, max_length=11, null=True, verbose_name='联系电话')),
                ('service_phone', models.CharField(blank=True, max_length=11, null=True, verbose_name='客服电话')),
            ],
            options={
                'verbose_name': '众筹项目',
                'verbose_name_plural': '众筹项目',
            },
        ),
        migrations.CreateModel(
            name='Return',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('0', '实物回报'), ('1', '虚拟物品回报')], max_length=1, verbose_name='回报类型')),
                ('supportmoney', models.IntegerField(verbose_name='支持资金')),
                ('content', models.CharField(max_length=255, verbose_name='回报内容')),
                ('explain', models.ImageField(max_length=255, upload_to='explain/%Y/%m', verbose_name='说明图片')),
                ('count', models.IntegerField(verbose_name='回报数量')),
                ('purchase', models.IntegerField(default=0, verbose_name='单笔限购')),
                ('freight', models.IntegerField(verbose_name='货运')),
                ('invoice', models.CharField(choices=[('0', '不开发票'), ('1', '开发票')], max_length=1, verbose_name='发票')),
                ('rtndate', models.CharField(max_length=11, verbose_name='回报时间')),
                ('projectid', models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Project', verbose_name='项目')),
            ],
            options={
                'verbose_name': '回报表',
                'verbose_name_plural': '回报表',
            },
        ),
        migrations.CreateModel(
            name='Support',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='标签类型')),
            ],
            options={
                'verbose_name': '标签',
                'verbose_name_plural': '标签',
            },
        ),
        migrations.CreateModel(
            name='Twolable',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='二级标签')),
                ('tag', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Tag', verbose_name='标签表')),
            ],
            options={
                'verbose_name': '二级标签',
                'verbose_name_plural': '二级标签',
            },
        ),
        migrations.CreateModel(
            name='Type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='名称')),
                ('remark', models.CharField(max_length=255, verbose_name='描述')),
            ],
            options={
                'verbose_name': '类别表',
                'verbose_name_plural': '类别表',
            },
        ),
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=30, unique=True, validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username. This value may contain only letters, numbers and @/./+/-/_ characters.')], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('nick_name', models.CharField(blank=True, max_length=255, null=True, verbose_name='登录名')),
                ('user_type', models.CharField(choices=[('0', '企业'), ('1', '个人')], max_length=12)),
                ('authstatus', models.CharField(choices=[('0', '未认证'), ('1', '实名认证申请中'), ('2', '已实名认证')], default=0, max_length=1, verbose_name='实名认证状态')),
                ('real_name', models.CharField(blank=True, max_length=255, null=True, verbose_name='真实名称')),
                ('cardnum', models.CharField(blank=True, max_length=255, null=True, verbose_name='身份证号')),
                ('accttye', models.CharField(choices=[('0', '企业'), ('1', '个体'), ('2', '个人'), ('3', '政府')], default=2, max_length=1, verbose_name='账目类型')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': '会员表',
                'verbose_name_plural': '会员表',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.AddField(
            model_name='support',
            name='member',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员'),
        ),
        migrations.AddField(
            model_name='support',
            name='project',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Project', verbose_name='项目'),
        ),
        migrations.AddField(
            model_name='support',
            name='returns',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Return', verbose_name='支持类型'),
        ),
        migrations.AddField(
            model_name='project',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='发起者'),
        ),
        migrations.AddField(
            model_name='project',
            name='tag',
            field=models.ManyToManyField(to='PublicDisplay.Twolable', verbose_name='标签'),
        ),
        migrations.AddField(
            model_name='project',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Type', verbose_name='分类'),
        ),
        migrations.AddField(
            model_name='order',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员id'),
        ),
        migrations.AddField(
            model_name='order',
            name='projectid',
            field=models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Project', verbose_name='项目id'),
        ),
        migrations.AddField(
            model_name='order',
            name='returnid',
            field=models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Return', verbose_name='回报id'),
        ),
        migrations.AddField(
            model_name='memberaddress',
            name='memberid',
            field=models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员id'),
        ),
        migrations.AddField(
            model_name='follower',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员'),
        ),
        migrations.AddField(
            model_name='follower',
            name='projectid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PublicDisplay.Project', verbose_name='项目'),
        ),
    ]
