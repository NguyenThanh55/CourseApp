# Generated by Django 4.2.7 on 2024-02-01 18:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('htproject', '0008_alter_user_isapproved'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='phone',
            field=models.TextField(default=0),
        ),
    ]