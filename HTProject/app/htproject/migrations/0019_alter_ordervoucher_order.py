# Generated by Django 4.2.7 on 2024-02-29 16:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('htproject', '0018_alter_rating_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordervoucher',
            name='order',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ordervoucher', to='htproject.order'),
        ),
    ]
