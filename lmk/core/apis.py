from django.conf.urls import url
from django.urls import path

from django.http import HttpResponse
from oauth2_provider.views.generic import ProtectedResourceView


class APIEndpoint(ProtectedResourceView):

    def get(self, request, *args, **kwargs):
        return HttpResponse('Hello Oauth2!')


urlpatterns = [
    url(r'^hello', APIEndpoint.as_view()),

]