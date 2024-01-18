from django.core import mail
from rest_framework import viewsets, permissions, generics, status
from rest_framework.authentication import BasicAuthentication, TokenAuthentication
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from htproject import email
from . import paginators, serializers, perms
from .models import User, City, District, Ward, Order, Rating, Auction, Voucher


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


# class SendMailViewSet(viewsets.ViewSet):
#
#     @action(methods=['post'], url_name="send_email", detail=True)
#     def send_email(self, request, pk):
#         host = request.user
#         # email_followers = Follow.objects.filter(followeduser=host).values('follower__email', 'follower__first_name', 'follower__last_name')
#         email_auctions = Auction.objects.filter(order__customer=host, order__id=pk).all().values('shipper__email')
#         success_count = Order.objects.get(id=pk)
#         connection = mail.get_connection()
#         # for auction in email_auctions:
#         subject = str(host.first_name + " " + host.last_name) + " có tin mới !!!" # title email
#         reciever_username = str(success_count['first_name'] + success_count['last_name'])
#         # tennguoigui = 'do coi ma'
#         tennguoidangtin = str(host.first_name + " " + host.last_name)
#         linkbaiviet = 'nhap'
#         tieudebaiviet = 'nhap'
#         # from_email = {host.email}
#         # to = {request.data.email}
#         receiver = "2051052120thanh@ou.edu.vn"
#         html_content = f"""
#         <p>Xin chào {reciever_username},</p>
#         <p>Chúng tôi xin thông báo rằng bạn đang theo dõi {tennguoidangtin}. Chúng tôi vừa đăng một bài viết mới và muốn chia sẻ nó với bạn.</p>
#         <p>Hãy truy cập vào <a href="{linkbaiviet}">{tieudebaiviet}</a> để đọc bài viết mới nhất của chúng tôi.</p>
#         <p>Xin chân thành cảm ơn và hy vọng bạn tìm thấy nội dung bài viết hữu ích.</p>
#         <p>Chúc bạn một ngày tốt lành!</p>
#         <img src='https://res.cloudinary.com/dstqvlt8d/image/upload/v1704609698/ASSS-avatar/a0lpq48qktdfsozlba97.jpg'/>
#         """
#         # msg = mail.EmailMessage(subject, html_content, from_email, [to], connection=connection)
#         msg = email.send_email(subject, html_content, success_count.email)
#
#         if msg.__eq__(True):
#             return Response({'message': 'Email sent successfully.'}, status=status.HTTP_200_OK)
#         else:
#             return Response({'message': 'Failed to send email.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

