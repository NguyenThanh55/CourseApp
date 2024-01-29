from rest_framework import permissions
from rest_framework.exceptions import PermissionDenied


class OwnerAuthenticated(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        return self.has_permission(request, view) and request.user == obj.user


class OrderAuthenticated(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        if request.user == obj.customer:
            return super().has_permission(request, view) and request.user == obj.customer
        else:
            raise PermissionDenied("You do not have permission to access this object.")


class AuctionAuthenticated(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        if request.user == obj.shipper:
            return self.has_permission(request, view) and request.user == obj.shipper
        else:
            raise PermissionDenied("You do not have permission to access this object.")