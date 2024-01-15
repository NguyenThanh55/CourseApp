from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter
from .admin import admin_site

router = DefaultRouter()
router.register('user', views.UserViewSet)
router.register('city', views.CityViewSet)
router.register('district', views.DistrictViewSet)
router.register('ward', views.WardViewSet)
router.register('order', views.OrderViewSet)
router.register('rating', views.RatingViewSet)
router.register('auction', views.AuctionViewSet)
router.register('voucher', views.VoucherViewSet)
# router.register('current_account', views.VoucherViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('admin/', admin_site.urls),
]