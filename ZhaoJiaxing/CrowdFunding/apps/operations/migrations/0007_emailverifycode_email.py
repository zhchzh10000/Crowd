# Generated by Django 2.0.5 on 2018-05-11 03:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0006_auto_20180511_1121'),
    ]

    operations = [
        migrations.AddField(
            model_name='emailverifycode',
            name='email',
            field=models.EmailField(default='', max_length=254, verbose_name='邮箱地址'),
            preserve_default=False,
        ),
    ]