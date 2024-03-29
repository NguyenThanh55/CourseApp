from rest_framework.serializers import ModelSerializer, SerializerMethodField, DateField
from cloudinary.models import CloudinaryField
from .models import User, City, District, Order, Rating, Auction, Voucher, OrderVoucher, Ward, Bill


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password']


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
        if user.role == "CUSTOMER":
            user.isApproved = True
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
        fields = ['id', 'title', 'discount', 'startDate', 'endDate']


class OrderVoucherSerializer(ModelSerializer):
    class Meta:
        model = OrderVoucher
        fields = ['id', 'decreased_money', 'order', 'voucher', 'useDate']


class OrderSerializer(ModelSerializer):
    # order_voucher = OrderVoucher.
    deliveryDate = DateField(format="%Y-%d-%m")

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

    def create(self, validated_data):
        delivery_date = validated_data.pop('deliveryDate')
        order = Order.objects.create(deliveryDate=delivery_date, **validated_data)
        return order


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
                  'toStreet', 'status',
                  ]

    def to_representation(self, instance):
        representation = super(OrderDetailSerializer, self).to_representation(instance)

        # Add full address information to the representation
        representation['from_address'] = self.get_full_address(instance.fromWard, instance.fromStreet)
        representation['to_address'] = self.get_full_address(instance.toWard, instance.toStreet)
        return representation

    def get_full_address(self, ward, street):
        ward_info = WardSerializer(ward).data
        district_info = DistrictSerializer(ward_info['district']).data
        city_info = CitySerializer(district_info['city']).data

        full_address = f"{street}, {ward_info['name']}, {district_info['name']}, {city_info['name']}"

        return full_address


class AuctionDetailSerializer(ModelSerializer):
    shipper = UserDetailSerializer()
    order = OrderSerializer()

    class Meta:
        model = Auction
        fields = ['id', 'title', 'content', 'shipper', 'order', 'status', 'money']


class AuctionSerializer(ModelSerializer):
    class Meta:
        model = Auction
        fields = ['id', 'title', 'content', 'shipper', 'order', 'status']


class RatingSerializer(ModelSerializer):
    user = UserDetailSerializer()
    order = OrderDetailSerializer()

    class Meta:
        model = Rating
        fields = ['id', 'content', 'score', 'user', 'order', 'created_date', 'updated_date']


class BillSerializer(ModelSerializer):
    order = OrderDetailSerializer()

    class Meta:
        model = Bill
        fields = ['id', 'total_money', 'order']


class OrderVoucherSerializer(ModelSerializer):

    class Meta:
        model = OrderVoucher
        fields = ['id', 'order', 'decreased_money', 'voucher', 'useDate']

    def create(self, validated_data):
        orderVoucher = OrderVoucher.objects.create(**validated_data)
        return orderVoucher