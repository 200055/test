# Generated by Django 3.2.6 on 2021-09-29 13:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('internet', '0004_orderplan'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='orderplan',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
