#!/usr/bin/env python3
# coding=utf-8
# date 2020-06-04 14:12:53
# author calllivecn <c-all@qq.com>


#from django.generic import TemplateView
from django.http import HttpResponse, JsonResponse
from django.views import View



class Hello(View):

    def get(self, request):
        print(f"request: {request}")
        name = request.GET.get("arg1")
        names = ",".join(request.GET.getlist("arg1"))
        return HttpResponse(f"hello {names}")


    def post(self, request, *args):
        print("request.POST: {}".format(request.POST))
        names = ",".join(request.POST.getlist("arg1"))
        print(f"names: {names}")
        return HttpResponse(f"hello {names}")
