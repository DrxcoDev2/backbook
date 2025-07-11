import logging
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render
from .models import Userprofile
import os

# Logger configurado en settings.py
logger = logging.getLogger('login_logger')

def get_client_ip(request):
    # Toma la IP real si hay proxy, si no, la directa
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)

        if form.is_valid():
            user = form.save()
            Userprofile.objects.create(user=user)
            logger.info(f'Nuevo usuario: {user.username} desde {get_client_ip(request)}')


            # Registrar el evento en logins.log
            logger.info('', extra={
                'username': user.username,
                'ip': get_client_ip(request)
            })

    else:
        form = UserCreationForm()

    return render(request, 'userprofile/signup.html', {
        'form': form
    })
