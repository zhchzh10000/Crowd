# Generated by Django 2.0.5 on 2018-05-15 11:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0004_auto_20180515_1120'),
    ]

    operations = [
        migrations.CreateModel(
            name='Return',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_re', models.ImageField(default='image_re/default.png', upload_to='image_re/%Y/%m')),
                ('type', models.CharField(choices=[(0, '实物回报'), (1, '虚拟物品回报')], default=0, max_length=20, verbose_name='回报类型')),
                ('supportmoney', models.IntegerField(verbose_name='支持金额')),
                ('content', models.CharField(max_length=200, verbose_name='回报内容')),
                ('count', models.IntegerField(default=0, verbose_name='回报数量')),
                ('signalpurchase', models.IntegerField(verbose_name='配送金额')),
                ('purchase', models.IntegerField(verbose_name='优惠金额')),
                ('freight', models.CharField(max_length=100, verbose_name='支付方式')),
                ('invoice', models.CharField(choices=[(0, '不限购'), (1, '限购')], max_length=100, verbose_name='单笔限购')),
                ('buy', models.CharField(choices=[(0, '不开发票'), (1, '开发票')], max_length=100, verbose_name='是否开发票')),
                ('rtndate', models.IntegerField(null=True, verbose_name='回报时间')),
                ('project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='project.Project', verbose_name='众筹计划')),
            ],
        ),
    ]