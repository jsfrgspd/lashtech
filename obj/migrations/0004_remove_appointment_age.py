# Generated by Django 4.2.6 on 2023-10-22 20:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('obj', '0003_appointment'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='appointment',
            name='age',
        ),
    ]
