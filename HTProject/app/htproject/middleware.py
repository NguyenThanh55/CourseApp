from django.utils.deprecation import MiddlewareMixin


class OAuth2Middleware(MiddlewareMixin):
    def process_request(self, request):
        if request.path_info == '/o/token/' and request.method == 'POST':
            request.POST = request.POST.copy()
            request.POST['client_id'] = 'zs81qvebBWJvDxIckWyPaF3daKW4K1777WrYqjJD'
            request.POST['client_secret'] = '1raenbI7OXZOVCEFXQktcaQOL7ktBHRhDXjaBPRTzUXjDyc9lzfPE7lhGWYxNhAbNpprp4y1w2hZpYvDug0luy7HaMKvyQwJadGHHCDkIVWXMavyJop9lzm0eepmHcPx'
            request.POST['grant_type'] = 'password'