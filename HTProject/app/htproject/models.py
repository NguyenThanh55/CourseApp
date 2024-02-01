from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField
from cloudinary.models import CloudinaryField

# Create your models here.


class User(AbstractUser):
    # avatar = models.ImageField(upload_to='imageUser/%Y/%m', null=False)
    avatar = CloudinaryField('avatar', null=True, blank=True)
    identityCard = models.CharField(max_length=12, null=True)
    isApproved = models.BooleanField(default=False, null=True)
    role = models.CharField(max_length=100, null=False)
    phone = models.TextField(default=0, null=False)


class BaseModel(models.Model):
    created_date = models.DateField(auto_now_add=True, null=True)
    updated_date = models.DateField(auto_now=True, null=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class City(models.Model):
    name = models.CharField(max_length=255, null=False)

    def __str__(self):
        return self.name


class District(models.Model):
    name = models.CharField(max_length=255, null=False)
    city = models.ForeignKey(City, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name


class Ward(models.Model):
    name = models.CharField(max_length=255, null=False)
    district = models.ForeignKey(District, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name


class Order(BaseModel):
    title = models.CharField(max_length=255, default="Đơn hàng của ")
    content = RichTextField()
    image = models.ImageField(upload_to='imageOrder/%Y/%m')
    shipper = models.ForeignKey(User, related_name="shipper", on_delete=models.SET_DEFAULT, default="1")
    customer = models.ForeignKey(User, related_name="customer", on_delete=models.SET_NULL, null=True)
    deliveryDate = models.DateField(auto_now=True, null=True)
    # fromCity = models.ForeignKey(City, related_name="fromCity", on_delete=models.SET_NULL, null=True)
    # fromDistrict = models.ForeignKey(District, related_name="fromDistrict", on_delete=models.SET_NULL, null=True)
    fromWard = models.ForeignKey(Ward, related_name="fromWard", on_delete=models.SET_NULL, null=True)
    fromStreet = models.CharField(max_length=100, null=False)
    # toCity = models.ForeignKey(City, related_name="toCity", on_delete=models.SET_NULL, null=True)
    # toDistrict = models.ForeignKey(District, related_name="toDistrict", on_delete=models.SET_NULL, null=True)
    toWard = models.ForeignKey(Ward, related_name="toWard", on_delete=models.SET_NULL, null=True)
    toStreet = models.CharField(max_length=100, null=False)
    status = models.CharField(max_length=100, default="New")

    class Meta:
        ordering = ["-created_date"]

    def __str__(self):
        return self.title + self.customer.first_name + " " + self.customer.last_name


class Bill(BaseModel):
    total_money = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)


class Rating(BaseModel):
    content = models.CharField(max_length=255, null=False)
    score = models.CharField(max_length=2, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)

    def __str__(self):
        return self.content


class Auction(BaseModel):
    title = models.CharField(max_length=255, default="Đấu giá của ")
    content = RichTextField()
    money = models.DecimalField(max_digits=12, decimal_places=3, null=True)
    shipper = models.ForeignKey(User, on_delete=models.CASCADE, related_name="auction_shipper")
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="auction_order")
    status = models.BooleanField(default=False)

    def __str__(self):
        return self.title + " " +  self.shipper.last_name + " " +  self.shipper.first_name


class Voucher(BaseModel):
    title = models.CharField(max_length=250, null=False, unique=True)
    discount = models.DecimalField(max_digits=10, decimal_places=2, null=False)
    startDate = models.DateField(null=False)
    endDate = models.DateField(null=False)
    orderVoucher = models.ManyToManyField(Order, through='OrderVoucher')

    def __str__(self):
        return self.title


class OrderVoucher(BaseModel):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    decreased_money = models.DecimalField(max_digits=12, decimal_places=3, null=True)
    voucher = models.ForeignKey(Voucher, on_delete=models.CASCADE)
    useDate = models.DateField(auto_now_add=True, null=True)

    def __str__(self):
        return f"{self.order.title} - {self.voucher.title}"


