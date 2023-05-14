from django.urls import path, include
from details.views import details, getCertificated, getProducerMaterials, getCertificates

urlpatterns = [
    path('', details),
    path('certified/', getCertificated),
    path('certificates/', getCertificates),
    path('materials/', getProducerMaterials),
]
