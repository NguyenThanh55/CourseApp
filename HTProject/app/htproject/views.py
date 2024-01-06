from rest_framework import viewsets, permissions, generics
from rest_framework.authentication import BasicAuthentication, TokenAuthentication
from rest_framework.parsers import MultiPartParser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.views import APIView

from . import paginators, serializers
from .models import User, City, District, Ward, Order, Rating, Auction, Voucher


class UserViewSet(viewsets.ViewSet,
                  generics.ListAPIView,
                  generics.CreateAPIView,
                  generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = serializers.UserSerializer  # get/post/detail/put/delete
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == "retrieve":
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]


class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    serializer_class = serializers.CitySerializer  # get/post/detail/put/delete
    # permission_classes = [permissions.IsAuthenticated]

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class DistrictViewSet(viewsets.ModelViewSet):
    queryset = District.objects.all()
    serializer_class = serializers.DistrictSerializer  # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class WardViewSet(viewsets.ModelViewSet):
    queryset = Ward.objects.all()
    serializer_class = serializers.WardSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = serializers.OrderSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class RatingViewSet(viewsets.ModelViewSet):
    queryset = Rating.objects.filter(active=True)
    serializer_class = serializers.RatingSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class AuctionViewSet(viewsets.ModelViewSet):
    queryset = Auction.objects.filter(active=True)
    serializer_class = serializers.AuctionSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class VoucherViewSet(viewsets.ModelViewSet):
    queryset = Voucher.objects.filter(active=True)
    serializer_class = serializers.VoucherSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]