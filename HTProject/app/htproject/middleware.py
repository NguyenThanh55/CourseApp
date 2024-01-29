from django.utils.deprecation import MiddlewareMixin


class OAuth2Middleware(MiddlewareMixin):
    def process_request(self, request):
        if request.path_info == '/o/token/' and request.method == 'POST':
            request.POST = request.POST.copy()
            request.POST['client_id'] = 'YAZKTBdtmg6Jwrz0npyrlGsxg4k2pgch0pjMkHQl'
            request.POST['client_secret'] = 'ct9T2YyxUpsZIdlcGw6kUFK5GkXsw5UjhX1mcuJqhdzYPPjfZDZj8W0RplkNFPjfvzZ9K1Yrk42wfQB1ALBBO2wvLmNQbWT3NkQq6w5H8mEsJ2Is79oWxVCe2BwQL0ox'
            request.POST['grant_type'] = 'password'