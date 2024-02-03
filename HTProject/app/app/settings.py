"""
Django settings for app project.

Generated by 'django-admin startproject' using Django 4.2.7.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""

from pathlib import Path
import cloudinary
import paypalrestsdk
from django.conf.global_settings import AUTH_USER_MODEL

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-hgwqsmc&!dz1&%6phrfdtizglnqk6r-$4u-$tw@!i)(z#!+w-k'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

PAYPAL_RECEIVER_EMAIL = 'sb-ptjap29441924@business.example.com'
PAYPAL_TEST = True
PAYPAL_BUY_BUTTON_IMAGE = 'https://res.cloudinary.com/the-proton-guy/image/upload/v1685882223/paypal-PhotoRoom_v9pay7.png'


ALLOWED_HOSTS = ['*', '192.168.1.79', '192.168.1.104']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'htproject.apps.HtprojectConfig',
    'rest_framework',
    'oauth2_provider',
    'ckeditor',
    'ckeditor_uploader',
    'drf_yasg',
    'corsheaders',
    'paypal.standard.ipn',
    'cloudinary',
]

MIDDLEWARE = [
    'htproject.middleware.OAuth2Middleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'oauth2_provider.middleware.OAuth2TokenMiddleware',
]

ROOT_URLCONF = 'app.urls'

MEDIA_ROOT = '%s/htproject/static/' % BASE_DIR
CKEDITOR_UPLOAD_PATH = "ckeditor/"
CORS_ALLOW_ALL_ORIGINS = True

import pymysql

pymysql.install_as_MySQLdb()

# Import the cloudinary.api for managing assets
# import cloudinary.api
# Import the cloudinary.uploader for uploading assets
# import cloudinary.uploader

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = 'jennythanh2001@gmail.com'
EMAIL_HOST_PASSWORD = 'lovqghqkrxizhnxv'

cloudinary.config(
    cloud_name="dohcsyfoi",
    api_key="688866398336719",
    api_secret="KG9wodomxnCS7iNhE1bubRkinlk",
    secure=True,
)

paypalrestsdk.configure({
    "mode": "sandbox",
    "client_id": "EFAzCkUOVhiUVErho_a3_EfnZiNeF3JmVFEjdtQBMIx7IRftjf58iYaYcT_hFZBYsMKUGvej9mwh5ncs",
    "client_secret": "EFAzCkUOVhiUVErho_a3_EfnZiNeF3JmVFEjdtQBMIx7IRftjf58iYaYcT_hFZBYsMKUGvej9mwh5ncs"
})


LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'django.log',  # Adjust the filename and path as needed
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}


REST_FRAMEWORK = {
    # 'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    # 'PAGE_SIZE': 10,
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'oauth2_provider.contrib.rest_framework.OAuth2Authentication',
        'rest_framework.authentication.TokenAuthentication',
        'rest_framework.authentication.BasicAuthentication',  # enables simple command line authentication
        'rest_framework.authentication.SessionAuthentication',
    ],
    # 'DEFAULT_PERMISSION_CLASSES': [
    #     'rest_framework.permissions.IsAdminUser',
    # ],
    'DEFAULT_PARSER_CLASSES': [
        'rest_framework.parsers.JSONParser',
    ]
}

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'app.wsgi.application'

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db',
        'USER': 'root',
        # 'PASSWORD': 'Thanh@123',
        'PASSWORD': '12345678',
        'HOST': ''  # mặc định localhost
    }
}

AUTH_USER_MODEL = 'htproject.User'

# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
