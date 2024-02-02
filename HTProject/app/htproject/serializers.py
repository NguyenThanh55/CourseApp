from rest_framework.serializers import ModelSerializer, SerializerMethodField
from .models import User, City, District, Order, Rating, Auction, Voucher, OrderVoucher, Ward, Bill


class UserDetailSerializer(ModelSerializer):

    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'email', 'avatar', 'role', 'identityCard',
                  'isApproved', 'phone']
        extra_kwargs = {
            "password": {"write_only": "true"}
        }

    def to_representation(self, instance):
        representation = super().to_representation(instance)

        if representation.get('avatar'):
            representation['avatar'] = "https://res.cloudinary.com/dohcsyfoi/" + representation['avatar']

        return representation

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
    city = CitySerializer()

    class Meta:
        model = District
        fields = ['id', 'name', 'city']


class WardSerializer(ModelSerializer):
    district = DistrictSerializer()
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


class OrderSerializer(ModelSerializer):
    # order_voucher = OrderVoucher.
    class Meta:
        model = Order
        fields = ['id', 'title', 'content', 'image', 'shipper',
                  'customer', 'deliveryDate', 'fromWard', 'fromStreet', 'toWard',
                  'toStreet']

    def to_representation(self, instance):
        representation = super().to_representation(instance)

        if representation.get('image'):
            representation['image'] = "https://res.cloudinary.com/dohcsyfoi/" + representation['image']

        return representation


class OrderDetailSerializer(OrderSerializer):
    fromWard = WardSerializer()
    toWard = WardSerializer()
    shipper = UserDetailSerializer()
    customer = UserDetailSerializer()
    order_voucher = OrderVoucher()
    # order_rating = RatingSerializer(many=True)
    # fromAddres = SerializerMethodField(method_name=get_fromAddress)

    class Meta:
        model = Order
        fields = ['id', 'title', 'content', 'image', 'shipper',
                  'customer', 'deliveryDate', 'fromWard', 'fromStreet', 'toWard',
                  'toStreet', 'status'
                  ]

    # def get_fromAddress(self, obj):
    #     base_url = 'https://res.cloudinary.com/dstqvlt8d/'
    #     if image.imageURL and base_url not in urljoin(base_url, image.imageURL.url):
    #         return image.imageURL.url
    #
    # imageURL = serializers.SerializerMethodField(method_name='get_image_url')


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