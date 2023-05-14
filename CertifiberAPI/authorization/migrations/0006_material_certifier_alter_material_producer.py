# Generated by Django 4.2.1 on 2023-05-13 22:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('authorization', '0005_material_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='material',
            name='certifier',
            field=models.ManyToManyField(related_name='certifier', to='authorization.account'),
        ),
        migrations.AlterField(
            model_name='material',
            name='producer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='producer', to='authorization.account'),
        ),
    ]