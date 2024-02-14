from django.urls import path, include
from django.views.i18n import set_language

from . import views, payment
from rest_framework.routers import DefaultRouter
from .admin import admin_site


router = DefaultRouter()
router.register('user', views.UserViewSet)
# router.register('shipper/<int:pk>', views.UserViewSet.shipper_orders)
router.register('city', views.CityViewSet)
router.register('district', views.DistrictViewSet)
router.register('ward', views.WardViewSet)
router.register('order', views.OrderViewSet)
router.register('rating', views.RatingViewSet)
router.register('auction', views.AuctionViewSet)
router.register('voucher', views.VoucherViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('admin/', admin_site.urls),
    path('pay/', payment.create_payment),
    path('paypal/', include("paypal.standard.ipn.urls")),
    path('order/<int:pk>/checkout/', views.OrderViewSet.checkout, name='checkout'),
    path('order/<int:pk>/payment-success/', views.OrderViewSet.paymentsuccessful, name='paymentsuccessful'),
    path('order/<int:pk>/payment-failed/', views.OrderViewSet.paymentfailed, name='paymentfailed'),
]