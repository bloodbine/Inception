#!/bin/bash

if [ ! -f /etc/nginx/ssl/nginx.key ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=DE/ST=Heilbronn/O=42/CN=gpasztor.42.fr"

    unlink /etc/nginx/sites-enabled/default

    sed -i 's/$WEBSITE_DOMAIN/'"$WEBSITE_DOMAIN"'/g' /etc/nginx/sites-available/nginx.conf
    cat /etc/nginx/sites-available/nginx.conf
    ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
    # sed -i 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf
    echo "127.0.0.1 $WEBSITE_DOMAIN" >> /etc/hosts
fi

nginx -g 'daemon off;'