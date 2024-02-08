# Generated by Django 4.2.7 on 2024-02-08 05:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('htproject', '0013_alter_auction_status_alter_order_fromstreet_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='shipper',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='shipper', to=settings.AUTH_USER_MODEL),
        ),
    ]