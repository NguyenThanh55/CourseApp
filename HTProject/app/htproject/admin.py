from django.contrib import admin
from .models import Category, Course, User


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['pk', 'name']
    search_fields = ['name']
    list_filter = ['id', 'name']


class HTProjectAdminSite(admin.AdminSite):
    site_header = "HT Express"
    site_title = "HT Express"


admin_site = HTProjectAdminSite('HTExpress')


# Register your models here.
admin_site.register(User)
admin_site.register(Category, CategoryAdmin)
admin_site.register(Course)
# admin.site.register(User)
# admin.site.register(Category, CategoryAdmin)
# admin.site.register(Course)