# Generated by Django 3.0.7 on 2021-09-26 11:26

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('internet', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(max_length=200, null=True, validators=[django.core.validators.MinLengthValidator(2)])),
            ],
        ),
        migrations.DeleteModel(
            name='Plan',
        ),
    ]
