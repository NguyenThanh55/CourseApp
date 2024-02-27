from io import BytesIO

from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa

from .models import Order, Voucher, User, OrderVoucher, Auction, Rating
from django.db.models import Count, Q, OuterRef
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


def search_shipper_for_date(param={}):

    selected_date = param.get('selected_date', '')
    selected_username = param.get('selected_username', '')

    user = User.objects.filter(role="SHIPPER")

    if selected_username:
        user = user.filter(Q(first_name__contains=selected_username) | Q(last_name__contains=selected_username))

    user_order_counts = []

    for u in user:
        total = 0
        orders = Order.objects.filter(shipper=u).all()
        if selected_date:
            orders = orders.filter(deliveryDate=selected_date)
        order_count = orders.filter(Q(shipper=u)).count()
        for o in orders:
            auctions = Auction.objects.filter(Q(order=o) & Q(shipper=o.shipper))
            for auction in auctions:
                vouchers = OrderVoucher.objects.filter(order=o)
                if vouchers.count() > 0:
                    for voucher in vouchers:
                        if o == voucher.order:
                            total += int(auction.money - voucher.decreased_money)
                else:
                    total += int(auction.money)
        user_order_counts.append({
            "user": str(u.first_name) + " " + str(u.last_name),
            "order_count": order_count,
            "total": total
        })

    return user_order_counts


def search_order_for_date(param={}):

    selected_date = param.get('selected_date', '')
    selected_order = param.get('selected_order', '')

    orders = Order.objects.filter(status="Completed")

    if selected_order:
        orders = orders.filter(content__contains=selected_order)

    if selected_date:
        orders = orders.filter(deliveryDate=selected_date)

    order_order_counts = []

    for o in orders:
        total = 0
        is_order_added = False
        order_count = orders.filter(content=o.content).count()
        # for o in orders:
        auctions = Auction.objects.filter(Q(order=o) & Q(shipper=o.shipper))
        for auction in auctions:
            vouchers = OrderVoucher.objects.filter(order=o)
            if vouchers.exists():
                for voucher in vouchers:
                    if o == voucher.order:
                        total += int(auction.money - voucher.decreased_money)
            else:
                total += int(auction.money)
        for order_entry in order_order_counts:
            if order_entry["order"] == o.content:
                order_entry["order_count"] = order_count
                order_entry["total"] = total
                is_order_added = True
                break

        if not is_order_added:
            order_order_counts.append({
                "order": o.content,
                "order_count": order_count,
                "total": total
            })

    return order_order_counts


def order_status_new(param={}):

    selected_date = param.get('selected_date', '')
    selected_order = param.get('selected_order', '')

    orders = Order.objects.filter(status="New")

    if selected_order:
        orders = orders.filter(content__contains=selected_order)

    if selected_date:
        orders = orders.filter(deliveryDate=selected_date)

    return orders


def order_status_pending(param={}):
    selected_date = param.get('selected_date', '')
    selected_order = param.get('selected_order', '')

    orders = Order.objects.filter(status="Pending")

    if selected_order:
        orders = orders.filter(content__contains=selected_order)

    if selected_date:
        orders = orders.filter(deliveryDate=selected_date)

    return orders


def order_status_completed(param={}):
    selected_date = param.get('selected_date', '')
    selected_order = param.get('selected_order', '')

    orders = Order.objects.filter(status="Completed")

    if selected_order:
        orders = orders.filter(content__contains=selected_order)

    if selected_date:
        orders = orders.filter(deliveryDate=selected_date)

    return orders


def info_order(id):
    return Order.objects.get(pk=id)


def auction_for_order(id):
    return Auction.objects.filter(order=id)


def voucher_for_order(id):
    return OrderVoucher.objects.filter(order=id)


def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("cp1252")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None


def list_order_no_ship():
    return Order.objects.filter(status="Pending")


def list_order_no_auction():
    orders = Order.objects.exclude(Q(shipper=1) | Q(auction_order__isnull=False))

    return orders