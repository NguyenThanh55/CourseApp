from .models import Order, Voucher, User, OrderVoucher, Auction
from django.db.models import Count, Q
from .serializers import UserDetailSerializer


def load_order(params={}):
    q = Order.objects.filter(active=True)

    kw = params.get('kw')
    if kw:
        q = q.filter(title__icontains=kw)

    shipper_id = params.get('shipper_id')
    if shipper_id:
        q = q.filter(shipper__id=shipper_id)

    return q


def count_order_by_shipper():
    return User.objects.annotate(count=Count('id')).values("id", "first_name", "last_name", "avatar", "count").order_by('-count')


def load_user(params={}):
    u = User.objects.filter(isApproved=False).all()

    kw = params.get('kw')
    if kw:
        u = u.filter(Q(first_name__icontains=kw) | Q(last_name__icontains=kw))

    # u = UserDetailSerializer(u)
    return u


def approve_user(id):
    user = User.objects.get(pk=id)  # Sử dụng phương thức get() thay vì filter() để lấy một đối tượng duy nhất
    user.isApproved = True
    user.save()
    print("Approved")
    return user


def reject_user(id):
    user = User.objects.get(pk=id)  # Sử dụng phương thức get() thay vì filter() để lấy một đối tượng duy nhất
    user.isApproved = False #từ chối không được đăng nhập
    user.is_active = False #tài khoản không hoạt động
    user.save()
    print("Reject")
    return user


def total_order():
    total = 0
    orders = Order.objects.all()

    for o in orders:
        auction = Auction.objects.filter(Q(order=o) & Q(shipper=o.shipper)).all()
        voucher = OrderVoucher.objects.filter(order=o).all()
        for a in auction:
            if voucher.count() > 0:
                for v in voucher:
                    if o.id == v.order:
                        total += a.money - v.decreased_money
                        print("Total" + str(total))
            else:
                total += a.money

            print("Total" + str(total))
    return total
