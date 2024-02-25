import json
from io import BytesIO
import io

from django.shortcuts import redirect, render
from django.template import Context
from django.template.response import TemplateResponse
from django.urls import path
from django import forms
from django.contrib import admin
from django.utils.safestring import mark_safe
from xhtml2pdf import pisa
from django.conf import settings

from .models import User, Voucher, City, District, Ward, Order, Rating, Auction
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from htproject import dao

import pdfkit
from django.template.loader import render_to_string, get_template
from django.http import HttpResponse


class VoucherAdmin(admin.ModelAdmin):
    list_display = ['pk', 'title']
    search_fields = ['title']
    list_filter = ['id', 'title']


class AuctionForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Auction
        fields = '__all__'


class AuctionAdmin(admin.ModelAdmin):
    form = AuctionForm


class HTProjectAdminSite(admin.AdminSite):
    site_header = "HT Express"
    site_title = "HT Express"
    index_title = "HT Express Administration"

    def get_urls(self):
        return [
                   path('stats/', self.stats_view, name="stats"),
                   path('list-orders/', self.list_orders),
                   path('order/<int:id>/', self.info_order, name="info"),
                   path('approved-accounts/', self.approved_account_view),
                   path('approve/<int:id>/', self.approve_account, name="approve"),
                   path('reject/<int:id>/', self.reject_account, name="reject"),
                   path('export_pdf/', self.export_pdf, name="export_pdf")
               ] + super().get_urls()

    def list_orders(self, request):
        return TemplateResponse(request, 'admin/list-orders.html', {
                                        'order_no_shipper': dao.list_order_no_ship(),
                                        'order_no_auction': dao.list_order_no_auction()
                                    })

    def stats_view(self, request):
        rate = dao.rate()
        adjusted_rate = rate / 5 * 100

        data = dao.search_shipper_for_date(request.GET)
        data_order = dao.search_order_for_date(request.GET)
        selected_date = request.GET.get('selected_date', '')
        selected_username = request.GET.get('selected_username', '')
        selected_order = request.GET.get('selected_order', '')

        context = {
            'adjusted_rate': adjusted_rate,
            'count_user': dao.count_user(),
            'total_orders': dao.total_order(),
            'rate': rate,
            'selected_date': selected_date,
            'selected_username': selected_username,
            'selected_order': selected_order,
            'data': json.dumps(data),
            'data_order': data_order,
            'order_status_new': dao.order_status_new(request.GET),
            'order_status_pending': dao.order_status_pending(request.GET),
            'order_status_completed': dao.order_status_completed(request.GET),
        }
        print(request.GET.get('selected_date', ''))
        return render(request, 'admin/stats.html', context)

    def info_order(self, request, id):
        return TemplateResponse(request, 'admin/info-order.html', {
                                'order': dao.info_order(id),
                                'auctions': dao.auction_for_order(id),
                                'vouchers': dao.voucher_for_order(id)
                                })

    def approved_account_view(self, request):
        return TemplateResponse(request, 'admin/approved-account.html', {
                                'user_approve': dao.load_user_approve(),
                                'user_approved': dao.load_user_approved(),
                                })

    def approve_account(self, request, id):
        if request.method == 'POST':
            dao.approve_user(id)
            return TemplateResponse(request, 'admin/approved-account.html', {
                                'user_approve': dao.load_user_approve(),
                                'user_approved': dao.load_user_approved(),
                                })  # Chuyển hướng đến trang approved_account_view
        return TemplateResponse(request, 'admin/base.html')

    def reject_account(self, request, id):
        if request.method == 'POST':
            dao.reject_user(id)
            return TemplateResponse(request, 'admin/approved-account.html', {
                                'user_aprrove': dao.load_user_approve(),
                                'user_aprroved': dao.load_user_approved(),
                                })  # Chuyển hướng đến trang approved_account_view

        return TemplateResponse(request, 'admin/base.html')

    def export_pdf(self, request):
        rate = dao.rate()
        adjusted_rate = rate / 5 * 100

        data = dao.search_shipper_for_date(request.GET)
        data_order = dao.search_order_for_date(request.GET)
        selected_date = request.GET.get('selected_date', '')
        selected_username = request.GET.get('selected_username', '')
        selected_order = request.GET.get('selected_order', '')

        context = {
            'adjusted_rate': adjusted_rate,
            'count_user': dao.count_user(),
            'total_orders': dao.total_order(),
            'rate': rate,
            'selected_date': selected_date,
            'selected_username': selected_username,
            'selected_order': selected_order,
            'data': json.dumps(data),
            'data_order': data_order,
            'order_status_new': dao.order_status_new(request.GET),
            'order_status_pending': dao.order_status_pending(request.GET),
            'order_status_completed': dao.order_status_completed(request.GET),
        }

        pdf = dao.render_to_pdf('admin/stats.html', context)
        # pdf = render_to_string('admin/stats.html', context)
        pdf_data = io.BytesIO()

        pisa.CreatePDF(pdf.encode('UTF-8', 'ignore'), dest=pdf_data, encoding='UTF-8')
        pdf_data.seek(0)

        response = HttpResponse(pdf_data, content_type='application/pdf')
        filename = "Stats_%s.pdf" % ("1")
        content = "attachment; filename='%s'" % (filename)
        response['Content-Disposition'] = content
        return response


admin_site = HTProjectAdminSite('HTExpress')


class UserAdminForm(forms.ModelForm):
    avatar = forms.ImageField(required=False)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'username', 'password',
                  'username', 'email', 'role', 'identityCard',
                  'isApproved', 'phone', 'avatar')


class UserAdmin(admin.ModelAdmin):
    list_display = ['pk', 'username', 'email', 'phone']
    readonly_fields = ['avatar_preview']
    form = UserAdminForm

    def avatar_preview(self, user):
        if user.avatar:
            return mark_safe(
                '<img src="{url}" width="120" />'.format(url=user.avatar.url)
            )
        return None

    avatar_preview.short_description = 'Avatar Preview'


# Register your models here.
admin_site.register(User, UserAdmin)
admin_site.register(Voucher, VoucherAdmin)
admin_site.register(City)
admin_site.register(District)
admin_site.register(Ward)
admin_site.register(Rating)
admin_site.register(Auction, AuctionAdmin)
admin_site.register(Order)
# admin.site.register(User)
# admin.site.register(Voucher, VoucherAdmin)
# admin.site.register(City)