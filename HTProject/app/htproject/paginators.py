from rest_framework.pagination import PageNumberPagination


class CityPaginator(PageNumberPagination):
    page_size = 10


class DistrictPaginator(PageNumberPagination):
    page_size = 10


class AuctionPaginator(PageNumberPagination):
    page_size = 20

