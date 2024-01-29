# Generated by Django 4.2.7 on 2024-01-18 17:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('htproject', '0004_auction_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='total_money',
        ),
        migrations.CreateModel(
            name='Bill',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateField(auto_now_add=True, null=True)),
                ('updated_date', models.DateField(auto_now=True, null=True)),
                ('active', models.BooleanField(default=True)),
                ('total_money', models.DecimalField(decimal_places=3, default=0, max_digits=10)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='htproject.order')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
