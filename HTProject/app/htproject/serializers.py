from rest_framework.serializers import ModelSerializer
from .models import User, City, District, Order, Rating, Auction, Voucher, OrderVoucher, Ward, Bill


class UserDetailSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'email', 'avatar', 'role', 'identityCard',
                  'isApproved', 'phone']
        extra_kwargs = {
            "password": {"write_only": "true"}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data["password"])
        user.save()

        return user


class CitySerializer(ModelSerializer):
    class Meta:
        model = City
        fields = ['id', 'name']


class DistrictSerializer(ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name', 'city']


class WardSerializer(ModelSerializer):
    class Meta:
        model = Ward
        fields = ['id', 'name', 'district']


class VoucherSerializer(ModelSerializer):
    class Meta:
        model = Voucher
        fields = ['id', 'title', 'discount', 'startDate', 'endDate', 'orderVoucher']


class OrderVoucherSerializer(ModelSerializer):
    class Meta:
        model = OrderVoucher
        fields = ['id', 'decreased_money', 'order', 'voucher', 'useDate']


class OrderDetailSerializer(ModelSerializer):
    fromWard = WardSerializer()
    toWard = WardSerializer()
    shipper = UserDetailSerializer()
    customer = UserDetailSerializer()
    order_voucher = OrderVoucher()
    # order_rating = RatingSerializer(many=True)

    class Meta:
        model = Order
        fields = ['id', 'title', 'content', 'image', 'shipper',
                  'customer', 'deliveryDate', 'fromWard', 'fromStreet', 'toWard',
                  'toStreet', 'total_money'
                  ]
        # fields = '__all__'


class OrderSerializer(ModelSerializer):
    # order_voucher = OrderVoucher.
    class Meta:
        model = Order
        fields = ['id', 'title', 'content', 'image', 'shipper',
                  'customer', 'deliveryDate', 'fromWard', 'fromStreet', 'toWard',
                  'toStreet']


class AuctionDetailSerializer(ModelSerializer):
    shipper = UserDetailSerializer()
    order = OrderSerializer()

    class Meta:
        model = Auction
        fields = ['id', 'title', 'content', 'shipper', 'order', 'status']


class AuctionSerializer(ModelSerializer):
    class Meta:
        model = Auction
        fields = ['id', 'title', 'content', 'shipper', 'order', 'status']


class RatingSerializer(ModelSerializer):
    user = UserDetailSerializer()

    class Meta:
        model = Rating
        fields = ['id', 'content', 'score', 'user', 'order']


class BillSerializer(ModelSerializer):
    order = OrderDetailSerializer()

    class Meta:
        model = Bill
        fields = ['id', 'total_money', 'order']