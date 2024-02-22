from django.shortcuts import redirect, render
from django.template.response import TemplateResponse
from django.urls import path
from django import forms
from django.contrib import admin
from django.utils.safestring import mark_safe

from .models import User, Voucher, City, District, Ward, Order, Rating, Auction
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from htproject import dao


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
                   path('stats/', self.stats_view),
                   path('approved-accounts/', self.approved_account_view),
                   path('approve/<int:id>/', self.approve_account, name="approve"),
                   path('reject/<int:id>/', self.reject_account, name="reject"),
               ] + super().get_urls()

    def stats_view(self, request):
        rate = dao.rate()
        adjusted_rate = rate / 5 * 100

        data_arr = [
            ['Canis Major Dwarf', 8000, 23.3],
            ['Sagittarius Dwarf', 24000, 4.5],
            ['Ursa Major II Dwarf', 30000, 14.3],
            ['Lg. Magellanic Cloud', 50000, 0.9],
            ['Bootes I', 60000, 13.1]
        ]

        context = {
            'adjusted_rate': adjusted_rate,
            'count_user': dao.count_user(),
            'total_orders': dao.total_order(),
            'rate': rate,
            'data_arr': data_arr,
            'result_date': dao.search_shipper_for_date(request.GET),
        }
        print(request.GET.get('selected_date', ''))
        return render(request, 'admin/stats.html', context)

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
                                'user_aprrove': dao.load_user_Approve(),
                                'user_aprroved': dao.load_user_Approved(),
                                })  # Chuyển hướng đến trang approved_account_view

        return TemplateResponse(request, 'admin/base.html')


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