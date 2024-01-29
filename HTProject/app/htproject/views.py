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
from htproject import email
from . import paginators, serializers, perms
from .models import User, City, District, Ward, Order, Rating, Auction, Voucher, Bill
from django.views.decorators.csrf import csrf_exempt


class UserViewSet(viewsets.ViewSet,
                  generics.ListAPIView,
                  generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = serializers.UserDetailSerializer  # get/post/detail/put/delete
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == "current_user":
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], url_name='current_user', detail=False)
    def current_user(self, request):
        return Response(serializers.UserDetailSerializer(request.user).data)

    @action(methods=['post'], url_name='create_user', detail=False)
    def create_user(self, request):
        serializer = serializers.UserDetailSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

    @action(methods=['get'], url_name='my_orders', detail=False)
    def my_orders(self, request):
        if request.user.role == "CUSTOMER":
            orders = Order.objects.filter(customer=request.user).all()
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)
        if request.user.role == "SHIPPER":
            orders = Order.objects.filter(shipper=request.user).all()
            return Response(serializers.OrderDetailSerializer(orders, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='orders', detail=True)
    def shipper_orders(self, request, pk):
        orders = Order.objects.filter(shipper__id=pk)
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


class OrderViewSet(viewsets.ViewSet,
                   generics.ListAPIView,
                   generics.CreateAPIView,
                   generics.RetrieveAPIView,
                   generics.UpdateAPIView,
                   generics.DestroyAPIView):
    queryset = Order.objects.all()
    serializer_class = serializers.OrderSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'partial_update' or self.action == 'put' or self.action == 'destroy':
            return [perms.OrderAuthenticated]
        return [permissions.IsAuthenticated()]

    @action(methods=['get'], url_name='auctions', detail=True)
    def auctions(self, request, pk):
        auctions = Auction.objects.filter(order=pk)
        return Response(serializers.AuctionDetailSerializer(auctions, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_name='ratings', detail=True)
    def ratings(self, request, pk):
        ratings = Rating.objects.filter(order=pk)
        return Response(serializers.RatingSerializer(ratings, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['post'], url_name='auction', detail=True)
    def auction(self, request, pk):
        a = Auction.objects.create(title=request.data.get('title'), content=request.data.get('content'),
                                   money=request.data.get('money'), shipper=request.user,
                                   order=self.get_object())

        return Response(serializers.AuctionSerializer(a).data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_name='rating', detail=True)
    def rating(self, request, pk):
        serializer = serializers.UserDetailSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_name="send_email", detail=True)
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
                msg = email.send_email(subject, html_content_fail, auction.shipper.email)
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
        msg = email.send_email(subject, html_content_success, self.get_object().shipper.email)
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

    # @action(methods=['get'], url_name="get_pay", detail=True)
    # def get_pay(self, request, pk):
    #     money = self.get_object().bill_set.first().total_money
    #     context = {
    #         'money': money,
    #         'pk': pk,
    #     }
    #     return TemplateResponse(request, 'admin/checkout.html', context)
    #
    # def success(self, request):
    #
    #     # Lấy Payment ID từ session
    #     payment_id = session.get('payment_id')
    #
    #     # Xác nhận thanh toán với PayPal
    #     payment = paypalrestsdk.Payment.find(payment_id)
    #     if payment.execute({"payer_id": payment.payer.payer_info.payer_id}):
    #
    #         # Thanh toán thành công, hiển thị trang hoàn tất thanh toán
    #
    #         return reverse('/admin')
    #     else:
    #         return "Lỗi trong quá trình xác nhận thanh toán"
    #
    # @action(methods=['post'], url_name="post_pay", detail=True)
    # def post_pay(self, request, pk):
    #     if request.method.__eq__('POST'):
    #         # total_money = self.get_object().bill_set.first().total_money
    #         money = request.data['money']
    #         breakpoint()
    #         payment = paypalrestsdk.Payment({
    #             "intent": "sale",
    #             "payer": {
    #                 "payment_method": "paypal"
    #             },
    #             "transactions": [{
    #                 "amount": {
    #                     "total": money,
    #                     "currency": "USD"
    #                 },
    #                 "description": "Mua hàng trên Flask Shop"
    #             }],
    #             # "redirect_urls": {
    #             #     "return_url": Response(self.success),
    #             #     "cancel_url": return TemplateResponse(request=request,'admin/stats_view.html')
    #             # }
    #             "redirect_urls": {
    #                 "return_url": reverse('success'),  # Replace 'success' with your success URL name or path
    #                 "cancel_url": reverse('stats_view')  # Replace 'stats_view' with your cancel URL name or path
    #             }
    #         })
    #
    #         # Lưu thông tin Payment
    #         if payment.create():
    #             # Lưu Payment ID vào session
    #             session['payment_id'] = payment.id
    #             # Redirect user đến trang thanh toán của PayPal
    #             for link in payment.links:
    #                 if link.method == 'REDIRECT':
    #                     redirect_url = str(link.href)
    #                     try:
    #                         Bill.objects.create(total_money=Decimal(money), order=self.get_object())
    #                         msg = 'Thanh cong'
    #                     except:
    #                         msg = 'Khong thanh cong'
    #                     return redirect(redirect_url)
    #         else:
    #                     return Response("Lỗi trong quá trình tạo Payment")

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


class VoucherViewSet(viewsets.ModelViewSet):
    queryset = Voucher.objects.filter(active=True)
    serializer_class = serializers.VoucherSerializer # get/post/detail/put/delete
    pagination_class = paginators.DistrictPaginator

    def get_permissions(self):
        if self.action == 'list':
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]


# class Payment(viewsets.ViewSet):
    # def list(self, request, pk):
    #     context = {
    #         'money': 1,
    #         'description': 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
    #     }
    #
    #     return render(request, 'paypal/pay.html', context)
    #
    # def success(self, request):
    #
    #     # Lấy Payment ID từ session
    #     payment_id = session.get('payment_id')
    #
    #     # Xác nhận thanh toán với PayPal
    #     payment = paypalrestsdk.Payment.find(payment_id)
    #     if payment.execute({"payer_id": payment.payer.payer_info.payer_id}):
    #
    #         # Thanh toán thành công, hiển thị trang hoàn tất thanh toán
    #
    #         return True
    #     else:
    #         return "Lỗi trong quá trình xác nhận thanh toán"
    #
    # def create(self, request, pk):
    #     payment = paypalrestsdk.Payment({
    #         "intent": "sale",
    #         "payer": {
    #             "payment_method": "paypal"
    #         },
    #         "transactions": [{
    #             "amount": {
    #                 "total": session['money'],
    #                 "currency": "USD"
    #             },
    #             "description": "Mua hàng trên Flask Shop"
    #         }],
    #         "redirect_urls": {
    #             "return_url": Response(self.success),
    #             "cancel_url": render('admin/stats_view.html')
    #         }
    #     })
    #
    #     # Lưu thông tin Payment
    #     if payment.create():
    #         # Lưu Payment ID vào session
    #         session['payment_id'] = payment.id
    #         # Redirect user đến trang thanh toán của PayPal
    #         for link in payment.links:
    #             if link.method == 'REDIRECT':
    #                 redirect_url = str(link.href)
    #                 try:
    #                     Order.objects.partial_update(
    #                                    total_money=session['price'])
    #
    #                     msg = 'Thanh cong'
    #                 except:
    #                     msg = 'Khong thanh cong'
    #                 return redirect(redirect_url)
    #     else:
    #         return "Lỗi trong quá trình tạo Payment"

