#  from rest_framework import status 
#  from rest_framwork.mixins import CreateModelMixin
#  from rest_framework.response import Response 
from rest_framework.viewsets import ModelViewSet 
from product.models import Product 
from product.serializers import ProductSerializer


class ProductViewSet(ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all().order_by('id')
