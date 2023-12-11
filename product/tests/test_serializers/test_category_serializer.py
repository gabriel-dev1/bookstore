from django.test import TestCase 
from product.factories import CategoryFactory
from product.serializers import CategorySerializer 

class TestCategorySerializer(TestCase):
    def setup(self): 
        self.category = CategoryFactory(title='food')
        self.category_serializer = CategorySerializer(self.category) 

    def test_order_serializer(self):
        serializer_data = self.category_serializer.data
        self.assertEquals(serializer_data['title'], 'food')