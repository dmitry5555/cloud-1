#!/bin/bash

echo "Запуск nginx с базовой конфигурацией..."
nginx

echo "Ожидание 5 секунд перед запуском certbot..."
sleep 5

echo "Запуск certbot..."
certbot --nginx -d 217-1141197.hopto.org -d www.217-1141197.hopto.org --non-interactive --agree-tos -m mikrolux@gmail.com

echo "Настройка автоматического обновления сертификатов..."
echo "0 12 * * * certbot renew --quiet" > /etc/cron.d/certbot-renew
chmod 0644 /etc/cron.d/certbot-renew
crontab /etc/cron.d/certbot-renew
service cron start

echo "Перезапуск nginx с окончательной конфигурацией..."
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf
nginx -s reload

echo "Запуск nginx в режиме foreground..."
# Останавливаем текущий процесс nginx
nginx -s stop
# Запускаем новый в foreground режиме
exec nginx -g "daemon off;"