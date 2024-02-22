from .models import Order, Voucher, User, OrderVoucher, Auction, Rating
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


def load_user_approve():
    u = User.objects.filter(isApproved=False).all()
    return u


def load_user_approved():
    u = User.objects.filter(Q(isApproved=True) & Q(role="SHIPPER")).all()

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
        auctions = Auction.objects.filter(Q(order=o) & Q(shipper=o.shipper))
        for auction in auctions:
            vouchers = OrderVoucher.objects.filter(order=o)
            if vouchers.count() > 0:
                for voucher in vouchers:
                    if o == voucher.order:
                        total += auction.money - voucher.decreased_money
            else:
                total += auction.money

    return total


def rate():
    rate = 0
    rates = Rating.objects.all()

    if rates.count() > 0:
        for r in rates:
            rate += r.score
        rate = rate / rates.count()
        return round(rate, 1)
    else:
        return 0


def count_user():
    return User.objects.filter(is_superuser=False).count()


def search_shipper_for_date(params={}):

    selected_date = params.get('selected_date')
    u = User.objects.filter(role="SHIPPER")

    if selected_date:
        print(selected_date)

    return u