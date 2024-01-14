from django.template.response import TemplateResponse
from django.urls import path
from django import forms
from django.contrib import admin
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

    def get_urls(self):
        return [
                   path('course-stats/', self.stats_view)
               ] + super().get_urls()

    def stats_view(self, request):
        return TemplateResponse(request, 'admin/stats_view.html', {
                                'order_count': dao.count_order_by_shipper()
                                })


admin_site = HTProjectAdminSite('HTExpress')


# Register your models here.
admin_site.register(User)
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