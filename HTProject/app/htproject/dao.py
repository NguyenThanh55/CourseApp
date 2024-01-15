from .models import Order, Voucher, User
from django.db.models import Count


def load_courses(params={}):
    q = Order.objects.filter(active=True)

    kw = params.get('kw')
    if kw:
        q = q.filter(title__icontains=kw)

    shipper_id = params.get('shipper_id')
    if shipper_id:
        q = q.filter(shipper__id=shipper_id)

    return q


def count_order_by_shipper():
    return User.objects.annotate(count=Count('id')).values("id", "first_name", "avatar", "count").order_by('-count')