#!/bin/sh
if [ ! -d "/etc/nginx/conf.d/default.conf" ]; then
cp -a /default.conf /etc/nginx/conf.d/
fi
chown -R www-data:www-data /data/www/
service php7.2-fpm start
service nginx start
