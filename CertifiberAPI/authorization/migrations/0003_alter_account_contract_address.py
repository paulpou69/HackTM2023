# Generated by Django 4.2.1 on 2023-05-13 18:08

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authorization', '0002_alter_account_contract_address_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='contract_address',
            field=models.CharField(max_length=42, null=True, validators=[django.core.validators.MinLengthValidator(42)]),
        ),
    ]
