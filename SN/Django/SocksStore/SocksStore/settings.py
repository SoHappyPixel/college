import os

DEBUG = True
ALLOWED_HOSTS = []
TEMPLATE_DEBUG = True

USE_TZ = True
USE_I18N = True
USE_L10N = True
TIME_ZONE = 'UTC'
LANGUAGE_CODE = 'en-us'

ROOT_URLCONF = 'SocksStore.urls'
WSGI_APPLICATION = 'SocksStore.wsgi.application'

BASE_DIR = os.path.dirname(os.path.dirname(__file__))
SECRET_KEY = 'p%%*^zyjt#(%-hko79dh&ttu&^(s!24g-ghy^kf07vu^h#59#1'

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'Store'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

STATIC_URL = '/static/'
STATICFILES_DIRS = ( os.path.join( BASE_DIR, 'static' ), )
TEMPLATE_DIRS = ( os.path.join( BASE_DIR, 'static', 'templates' ), )
