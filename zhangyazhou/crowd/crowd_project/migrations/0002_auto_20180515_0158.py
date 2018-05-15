# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
        ('crowd_project', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='follow',
            name='member',
            field=models.ForeignKey(to='users.Member', verbose_name='会员'),
        ),
        migrations.AddField(
            model_name='descimage',
            name='crowd',
            field=models.ForeignKey(to='crowd_project.CrowdFundProjects', verbose_name='对应项目'),
        ),
        migrations.AddField(
            model_name='crowdfundprojects',
            name='member',
            field=models.ForeignKey(to='users.Member', verbose_name='发起会员'),
        ),
        migrations.AddField(
            model_name='crowdfundprojects',
            name='pro_type',
            field=models.ForeignKey(to='crowd_project.ProType', verbose_name='项目类型'),
        ),
    ]
