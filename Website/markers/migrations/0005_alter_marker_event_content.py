# Generated by Django 4.0.3 on 2022-03-16 21:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('markers', '0004_alter_marker_country_name_alter_marker_event_content_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='marker',
            name='event_content',
            field=models.CharField(max_length=1000, null=True),
        ),
    ]
