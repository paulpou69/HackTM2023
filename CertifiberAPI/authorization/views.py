from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from authorization.models import Account
import json
from django.forms.models import model_to_dict

# Create your views here.

@api_view(["POST"])
def register(request):
    data = json.loads(request.body)
    account = Account(account_type=data["account_type"],wallet_address=data["wallet_address"],name=data["name"],contract_address=data["contract_address"])
    account.save()
    
    return Response({"message":"OK"},status=200)

@api_view(["POST"])
def login(request):
    address = json.loads(request.body)["address"]
    account = Account.objects.filter(wallet_address=address)

    return Response(account.values())