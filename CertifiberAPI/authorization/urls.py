from django.urls import path, include
from authorization.views import login,register
urlpatterns = [
    path('login/', login),
    path('register/', register)
]
