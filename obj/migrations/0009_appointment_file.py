# Generated by Django 4.2.6 on 2023-10-24 11:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obj', '0008_rename_user_appointment_userid'),
    ]

    operations = [
        migrations.AddField(
            model_name='appointment',
            name='file',
            field=models.ImageField(blank=True, null=True, upload_to='images/'),
        ),
    ]
