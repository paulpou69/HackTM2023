from django.db import models
from django.core.validators import MinLengthValidator


# Create your models here.

class Account(models.Model):
    account_type = models.IntegerField(null=None)
    wallet_address = models.CharField(max_length=42,
                               validators=[MinLengthValidator(42)])
    name = models.CharField(max_length=200)
    contract_address = models.CharField(max_length=42,
                               validators=[MinLengthValidator(42)],null=True)
    
class Material(models.Model):
    certifier = models.ManyToManyField('Account', related_name="certifier")
    producer = models.ForeignKey('Account',on_delete=models.CASCADE,related_name="producer")
    name = models.CharField(max_length=200)
    contract_address = models.CharField(max_length=42,
                               validators=[MinLengthValidator(42)],null=True)
    