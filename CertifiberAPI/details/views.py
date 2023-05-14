from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from authorization.models import Account, Material
import json
from django.conf import settings


#Manage stuff
@api_view(["GET"])
def details(request):
    contract_address = json.loads(request.body)["contract_address"]
    account = Account.objects.filter(contract_address=contract_address)

    return Response(account.values())

@api_view(["POST"])
def getProducerMaterials(request):
    address = json.loads(request.body)["address"]
    account = Account.objects.filter(wallet_address=address)[0]
    materials = Material.objects.filter(producer=account)
    print(materials)

    return Response(materials.values())

@api_view(["POST"])
def getCertificatorName(request):
    address = json.loads(request.body)["contract_address"]
    account = Account.objects.filter(contract_address=address)[0]

    return Response({"name":account.name})


@api_view(["POST"])
def getCertificated(request):
    contract_address = json.loads(request.body)["contract_address"]
    cert = fetchCertificated(contract_address)
    return Response({"certified":cert})

def fetchCertificated(address):
    contract = settings.WEB3_PROVIDER.eth.contract(address=address, abi=settings.CERTIFIER_ABI)
    certified_count = contract.functions.certified().call()
    certified=[]
    for _ in range(certified_count):
        address = contract.functions.certifiedProducers(_).call()
        if(contract.functions.isCertified(address).call()==True):
            material = Material.objects.filter(contract_address=address)
            if len(material)>0:
                certified.append(material.values()[0])

    return certified

@api_view(["POST"])
def getCertificates(request):
    contract_address = json.loads(request.body)["contract_address"]
    cert = fetchCertificates(contract_address)
    return Response({"certifications":cert})

def fetchCertificates(address):
    contract = settings.WEB3_PROVIDER.eth.contract(address=address, abi=settings.PRODUCT_ABI)
    certification_count = contract.functions.certifications().call()
    print(certification_count)
    certifies=[]
    for _ in range(certification_count):
        address = contract.functions.certificationList(_).call()
        if(contract.functions.certificates(address).call()==True):
            certificate = Account.objects.filter(contract_address=address)
            if len(certificate)>0:
                certifies.append(certificate.values()[0])

    return certifies

@api_view(["POST"])
def getProducts(request):
    contract_address = json.loads(request.body)["contract_address"]
    products = fetchProducts()

    return Response({"products":products})

def fetchProducts(contract_address):
    pass

