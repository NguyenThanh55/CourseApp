from rest_framework.serializers import ModelSerializer
from .models import User, City, District, Order, Rating, Auction, Voucher


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'email', 'avatar', 'role', 'identityCard',
                  'isApproved']
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
        fields = ['id', 'name']


class WardSerializer(ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name']


class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = ['id', 'title', 'content', 'image', 'shipper',
                  'customer', 'deliveryDate', 'fromWard', 'fromStreet', 'toWard',
                  'toStreet']
        # fields = '__all__'


class RatingSerializer(ModelSerializer):
    class Meta:
        model = Rating
        fields = ['id', 'content', 'score', 'user', 'order']


class AuctionSerializer(ModelSerializer):
    class Meta:
        model = Auction
        fields = ['id', 'title', 'content', 'shipper', 'order']


class VoucherSerializer(ModelSerializer):
    class Meta:
        model = Voucher
        fields = ['id', 'title', 'discount', 'startDate', 'endDate', 'orderVoucher']


