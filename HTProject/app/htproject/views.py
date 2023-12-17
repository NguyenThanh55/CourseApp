# from rest_framework import viewsets, permissions
# from rest_framework.authentication import BasicAuthentication, TokenAuthentication
# from rest_framework.permissions import IsAdminUser
# from rest_framework.views import APIView
#
# from .models import Course
# from .serializers import CourseSerializer
#
#
# class CourseViewSet(viewsets.ModelViewSet):
#     queryset = Course.objects.filter(active=True)
#     serializer_class = CourseSerializer  # get/post/detail/put/delete
#     permission_classes = [permissions.IsAuthenticated]
#
#     def get_permissions(self):
#         if self.action == 'list':
#             return [permissions.AllowAny()]
#
#         return [permissions.IsAuthenticated()]

