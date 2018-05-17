# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-05-12 18:10
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('permit', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='发起者'),
        ),
        migrations.AddField(
            model_name='project',
            name='tag',
            field=models.ManyToManyField(to='permit.Twolable', verbose_name='标签'),
        ),
        migrations.AddField(
            model_name='project',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='permit.Type', verbose_name='分类'),
        ),
        migrations.AddField(
            model_name='order',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员id'),
        ),
        migrations.AddField(
            model_name='order',
            name='projectid',
            field=models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to='permit.Project', verbose_name='项目id'),
        ),
        migrations.AddField(
            model_name='order',
            name='returnid',
            field=models.ForeignKey(max_length=11, on_delete=django.db.models.deletion.CASCADE, to='permit.Return', verbose_name='回报id'),
        ),
        migrations.AddField(
            model_name='follower',
            name='memberid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='会员'),
        ),
        migrations.AddField(
            model_name='follower',
            name='projectid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='permit.Project', verbose_name='项目'),
        ),
    ]
