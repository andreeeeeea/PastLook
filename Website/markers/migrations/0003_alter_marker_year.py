# Generated by Django 4.0.3 on 2022-03-15 21:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('markers', '0002_rename_name_marker_event_name_marker_country_name_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='marker',
            name='year',
            field=models.DateField(null=True),
        ),
    ]
