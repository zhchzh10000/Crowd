# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-05-14 11:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0002_project_member'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='a_word_intro',
            field=models.CharField(max_length=40, verbose_name='一句话自我介绍'),
        ),
        migrations.AlterField(
            model_name='project',
            name='self_intro',
            field=models.TextField(max_length=160, verbose_name='详细自我介绍'),
        ),
    ]
