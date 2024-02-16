import uuid
from decimal import Decimal
from os import path
from urllib.parse import urlencode

import paypalrestsdk
from django.core import mail
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.template.response import TemplateResponse
from django.urls import reverse
from paypal.standard.forms import PayPalPaymentsForm
from requests import session
from rest_framework import viewsets, permissions, generics, status
from rest_framework.authentication import BasicAuthentication, TokenAuthentication
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
import utils
from app import settings
from htproject import myemail
from . import paginators, serializers, perms
from .models import User, City, District, Ward, Order, Rating, Auction, Voucher, Bill, OrderVoucher
from django.views.decorators.csrf import csrf_exempt
import logging
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema


logger = logging.getLogger(__name__)


class UserViewSet(viewsets.ViewSet,
                  generics.ListAPIView,
                  generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = serializers.UserDetailSerializer  # get/post/detail/put/delete
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == "create_user":
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]

    @action(methods=['get'], url_path='current-user', url_name='current-user', detail=False)
    def current_user(self, request):
        return Response(serializers.UserDetailSerializer(request.user).data, status=status.HTTP_200_OK)

    @swagger_auto_schema(
        operation_description="Create a new user",
        request_body=serializers.UserDetailSerializer,
        responses={
            201: openapi.Response(
                description="Successfully",
                schema=serializers.OrderSerializer
            ),
            400: openapi.Response(
                description="Bad request"
            )
        }
    )
    @action(methods=['post'], url_path='create-user', url_name='create-user', detail=False)
    def create_user(self, request):
        serializer = serializers.UserDetailSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], url_path='my-orders', url_name='my-orders', detail=False)
    def my_orders(self, request):
        if request.user.role == "CUSTOMER":
            orders = Order.objects.filter(customer=request.user).all()
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)
        if request.user.role == "SHIPPER":
            orders = Order.objects.filter(shipper=request.user).all()
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_path='shipper-orders', url_name='shipper-orders', detail=True)
    def shipper_orders(self, request, pk):
        orders = Order.objects.filter(shipper__id=pk)
        if not orders:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='auctions', detail=True)
    def auctions(self, request, pk):
        auctions = Auction.objects.filter(shipper__id=pk)
        if not auctions:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.AuctionDetailSerializer(auctions, many=True).data, status=status.HTTP_200_OK)


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
    # pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class WardViewSet(viewsets.ModelViewSet):
    queryset = Ward.objects.all()
    serializer_class = serializers.WardSerializer # get/post/detail/put/delete
    # pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


class OrderViewSet(viewsets.ViewSet,
                   # generics.ListAPIView,
                   # generics.CreateAPIView,
                   generics.RetrieveAPIView,
                   # generics.UpdateAPIView,
                   generics.DestroyAPIView):
    queryset = Order.objects.filter(active=True).all()
    serializer_class = serializers.OrderSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_queryset(self):
        queries = self.queryset

        q = self.request.query_params.get("q")
        if q:
            queries = queries.filter(title__icontains=q)

        return queries

    def get_permissions(self):
        if self.action == 'partial_update' or self.action == 'put' or self.action == 'destroy':
            return [perms.OrderAuthenticated]
        return [permissions.IsAuthenticated()]

    @swagger_auto_schema(
        operation_description="Create a new order",
        request_body=serializers.OrderSerializer,
        responses={
            201: openapi.Response(
                description="Successfully",
                schema=serializers.OrderSerializer
            ),
            400: openapi.Response(
                description="Bad request"
            )
        }
    )
    @action(methods=['post'], url_path='create-order', url_name='create-order', detail=False)
    def create_order(self, request):
        if request.user.role == "CUSTOMER":
            serializer = serializers.OrderSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            # return Response("Data is invalid", status=status.HTTP_400_BAD_REQUEST)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response("Forbidden", status=status.HTTP_403_FORBIDDEN)

    @swagger_auto_schema(
        operation_description="Update order with shipper and status",
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'shipper': openapi.Schema(type=openapi.TYPE_INTEGER, description='ID of the shipper User'),
                'status': openapi.Schema(type=openapi.TYPE_STRING, description='Status for Order'),
            },
            required=['shipper', 'status'],
        ),
        responses={
            200: openapi.Response(
                description="Successfully",
            ),
            400: openapi.Response(
                description="Bad request",
            ),
            404: openapi.Response(
                description="Not exist"
            )
        }
    )
    @action(methods=['patch'], url_path='update-shipper-for-order', url_name='update-shipper-for-order', detail=True)
    def update_shipper_for_order(self, request, pk):
        shipper_id = request.data.get('shipper')
        status_order = request.data.get('status')
        try:
            order = self.queryset.get(id=pk)

        except Order.DoesNotExist:
            return Response("This order does not exist.", status=status.HTTP_404_NOT_FOUND)

        if order.active == 0:
            return Response("The order has been deleted", status=status.HTTP_404_NOT_FOUND)

        # Lấy đối tượng User từ shipper_id
        try:
            shipper = User.objects.get(id=shipper_id)
        except User.DoesNotExist:
            return Response("The shipper User does not exist.", status=status.HTTP_400_BAD_REQUEST)

        order.shipper = shipper
        order.status = status_order
        order.save()
        return Response("Change value order successfully.", status=status.HTTP_200_OK)

    @swagger_auto_schema(
        operation_description="Update detail order",
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'title': openapi.Schema(type=openapi.TYPE_STRING, description='Title of the order'),
                'content': openapi.Schema(type=openapi.TYPE_STRING, description='Content of the order'),
                'image': openapi.Schema(type=openapi.TYPE_STRING, description='Image URL for the order'),
                'deliveryDate': openapi.Schema(type=openapi.TYPE_STRING, format=openapi.FORMAT_DATE,
                                               description='Delivery date of the order'),
                'fromStreet': openapi.Schema(type=openapi.TYPE_STRING,
                                             description='Street address of the source location'),
                'fromWard': openapi.Schema(type=openapi.TYPE_INTEGER,
                                           description='ID of the ward for the source location'),
                'toStreet': openapi.Schema(type=openapi.TYPE_STRING,
                                           description='Street address of the destination location'),
                'toWard': openapi.Schema(type=openapi.TYPE_INTEGER,
                                         description='ID of the ward for the destination location'),
            }
        ),
        responses={
            200: openapi.Response(
                description="Successfully",
            ),
            400: openapi.Response(
                description="Bad request",
            ),
            404: openapi.Response(
                description="Not exist"
            )
        }
    )
    @action(methods=['patch'], url_path='update-detail-for-order', url_name='update-detail-for-order', detail=True)
    def update_detail_for_order(self, request, pk):
        title = request.data.get('title')
        content = request.data.get('content')
        image = request.data.get('image')
        delivery_date = request.data.get('deliveryDate')
        from_street = request.data.get('fromStreet')
        from_ward_id = request.data.get('fromWard')
        to_street = request.data.get('toStreet')
        to_ward_id = request.data.get('toWard')

        try:
            order = self.queryset.get(id=pk)

        except Order.DoesNotExist:
            return Response("This order does not exist.", status=status.HTTP_404_NOT_FOUND)

        if order.active == 0:
            return Response("The order has been deleted", status=status.HTTP_404_NOT_FOUND)

        order.title = title if title is not None else order.title
        order.content = content if content is not None else order.content
        order.image = image if image is not None else order.image
        order.deliveryDate = delivery_date if delivery_date is not None else order.deliveryDate
        order.fromStreet = from_street if from_street is not None else order.fromStreet
        order.fromWard_id = from_ward_id if from_ward_id is not None else order.fromWard
        order.toStreet = to_street if to_street is not None else order.toStreet
        order.toWard_id = to_ward_id if to_ward_id is not None else order.toWard

        order.save()
        return Response("Change value order successfully.", status=status.HTTP_200_OK)

    @action(methods=['get'], url_path='no-shipper', url_name='no-shipper', detail=False)
    def no_shipper(self, request):
        orders = Order.objects.filter(shipper__isnull=True)
        if not orders:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='auctions', detail=True)
    def auctions(self, request, pk):
        auctions = Auction.objects.filter(order=pk)
        if not auctions:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.AuctionDetailSerializer(auctions, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='ratings', detail=True)
    def ratings(self, request, pk):
        ratings = Rating.objects.filter(order=pk)
        if not ratings:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.RatingSerializer(ratings, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='vouchers', detail=True)
    def vouchers(self, request, pk):
        orderVouchers = OrderVoucher.objects.filter(order=pk)
        if not orderVouchers:
            return Response("Unauthorized", status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializers.OrderVoucherSerializer(orderVouchers, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['post'], url_name='auction', detail=True)
    def auction(self, request, pk):
        a = Auction.objects.create(title=request.data.get('title'), content=request.data.get('content'),
                                   money=request.data.get('money'), shipper=request.user,
                                   order=self.get_object())
        if not a:
            return Response("Bad request", status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializers.AuctionSerializer(a).data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_name='rating', detail=True)
    def rating(self, request, pk):
        # serializer = serializers.UserDetailSerializer(data=request.data)
        # if serializer.is_valid():
        #     serializer.save()
        a = Rating.objects.create(content=request.data.get('content'),
                                  score=request.data.get('score'),
                                  user=request.user,
                                  order=self.get_object())
        if not a:
            return Response("Bad request", status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializers.RatingSerializer(a).data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_path='send-email', url_name="send-email", detail=True)
    def send_email(self, request, pk):
        host = request.user
        email_auctions = Auction.objects.filter(order__customer=host, order__id=pk).all()
        # breakpoint()
        # success_count = Order.objects.get(pk=pk)
        connection = mail.get_connection()
        for auction in email_auctions:
            # breakpoint()
            if auction.shipper.email != self.get_object().shipper.email:
                subject = str(host.first_name + " " + host.last_name) + " có tin buồn !!!"  # title email
                # a = Auction.objects.filter(shipper__email=auction).values('shipper')
                # reciever_username = a.shipper.first_name + a.shipper.last_name
                order_name = self.get_object().title
                order_username = self.get_object().customer.first_name + self.get_object().customer.last_name
                linkbaiviet = 'nhap'
                html_content_fail = f"""
                            <p>Xin chào <Strong>Thanh</Strong>,</p>
                            <p>Chúng tôi rất tiếc phải thông báo rằng bạn đã đấu giá thất bại đơn hàng <Strong>{order_name}</Strong> của <Strong>{order_username}</Strong>.</p>
                            <p>Xin chân thành cảm ơn bạn đã đến và tham gia đấu giá vào đơn hàng của tôi.</p>
                            <p>Chúc bạn một ngày tốt lành!</p>
                            <img src='https://res.cloudinary.com/dstqvlt8d/image/upload/v1704609698/ASSS-avatar/a0lpq48qktdfsozlba97.jpg'/>
                            """
                msg = myemail.send_email(subject, html_content_fail, auction.shipper.email)
                # breakpoint()
                # if msg.__eq__(1):
                #     return Response({'message': 'Successfully.'}, status=status.HTTP_200_OK)
                # else:
                #     return Response({'message': 'Failed.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                # breakpoint()
        subject = str(host.first_name + " " + host.last_name) + " có tin mới !!!"  # title email
        reciever_username = self.get_object().shipper.first_name + self.get_object().shipper.last_name
        order_name = self.get_object().title
        order_username = self.get_object().customer.first_name + self.get_object().customer.last_name
        address = self.get_object().fromStreet + ", phường " + self.get_object().fromWard.name + ", " +\
                  self.get_object().fromWard.district.name + " , Thành phố " + self.get_object().fromWard.district.city.name
        linkbaiviet = 'nhap'
        html_content_success = f"""
            <p>Xin chào <Strong>{reciever_username}</Strong>,</p>
            <p>Chúng tôi xin thông báo rằng bạn đã đấu giá thành công đơn hàng <Strong>{order_name}</Strong> của <Strong>{order_username}</Strong>.</p>
            <p>Bạn vui lòng đến địa chỉ này để lấy hàng: <Strong>{address}</Strong></p>
            <p>Xin chân thành cảm ơn.</p>
            <p>Chúc bạn một ngày tốt lành!</p>
            <img src='https://res.cloudinary.com/dstqvlt8d/image/upload/v1704609698/ASSS-avatar/a0lpq48qktdfsozlba97.jpg'/>
            """
        msg = myemail.send_email(subject, html_content_success, self.get_object().shipper.email)
        # msg.content_subtype = "html"
        # msg = msg.send()
        if msg.__eq__(1):
            return Response({'message': 'Email sent successfully.'}, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'Failed to send email.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def get_urls(self):
        return [
                   path('<int:pk>/get_pay/', self.get_pay),
                   path('<int:pk>/post_pay/', self.post_pay)
               ] + super().get_urls()

    @action(methods=['get'], url_name='checkout', detail=True)
    def checkout(self, request, pk):

        order = Order.objects.get(id=pk)
        # money = order.auction_order.money
        host = request.get_host()
        # money = self.get_object().bill_set.first().total_money
        money = 100000
        paypal_checkout = {
            'business': settings.PAYPAL_RECEIVER_EMAIL,
            'amount': money,
            'item_name': self.get_object().title,
            'invoice': uuid.uuid4(),
            'currency_code': 'USD',
            'notify_url': f"http://{host}{reverse('paypal-ipn')}",
            'return_url': f"http://{host}{reverse('paymentsuccessful', kwargs={'pk': pk})}",
            'cancel_url': f"http://{host}{reverse('paymentfailed', kwargs={'pk': pk})}",
        }

        paypal_payment = PayPalPaymentsForm(initial=paypal_checkout)

        context = {
            'order': order,
            'paypal': paypal_payment,
            'money': money,
        }

        return render(request, 'admin/checkout.html', context)

    def paymentsuccessful(request, pk):

        order = Order.objects.get(id=pk)
        bill = Bill.objects.create(total_money=100000, order=order)
        return render(request, 'admin/payment-success.html', {'order': order,
                                                              'bill': bill})

    def paymentfailed(request, pk):

        order = Order.objects.get(id=pk)

        return render(request, 'admin/payment-failed.html', {'order': order})


class BillViewSet(viewsets.ViewSet,
                  generics.CreateAPIView):
    queryset = Bill.objects.all()
    serializer_class = serializers.BillSerializer
    pagination_class = paginators.AuctionPaginator
    # permission_classes = [perms.OwnerAuthenticated]


class RatingViewSet(viewsets.ViewSet,
                    generics.DestroyAPIView,
                    generics.UpdateAPIView):
    queryset = Rating.objects.all()
    serializer_class = serializers.RatingSerializer # get/post/detail/put/delete
    pagination_class = paginators.AuctionPaginator
    permission_classes = [perms.OwnerAuthenticated]


class AuctionViewSet(viewsets.ViewSet,
                     generics.DestroyAPIView,
                     generics.UpdateAPIView):
    queryset = Auction.objects.all()
    serializer_class = serializers.AuctionDetailSerializer # get/post/detail/put/delete
    pagination_class = paginators.AuctionPaginator
    permission_classes = [perms.AuctionAuthenticated]


class VoucherViewSet(viewsets.ModelViewSet,
                     generics.ListAPIView):
    queryset = Voucher.objects.filter(active=True)
    serializer_class = serializers.VoucherSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]

