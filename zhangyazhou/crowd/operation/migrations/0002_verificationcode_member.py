# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
        ('operation', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='verificationcode',
            name='member',
            field=models.ForeignKey(to='users.Member', verbose_name='会员'),
        ),
    ]
