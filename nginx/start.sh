#!/bin/bash
set -ex

echo "Старт: временная конфигурация nginx (без SSL)..."
cp /etc/nginx/nginx-init.conf /etc/nginx/nginx.conf
nginx

curl -I http://localhost || echo "Локальный nginx не отвечает"

echo "Получение SSL через certbot..."
certbot --nginx -d 217-1141197.hopto.org --non-interactive --agree-tos -m mikrolux@gmail.com

echo "Установка основного SSL-конфига nginx..."
cp /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

echo "Перезапуск nginx..."
nginx -s reload

echo "Настройка автоматического продления сертификата..."
echo "0 12 * * * root certbot renew --quiet && nginx -s reload" > /etc/cron.d/certbot-renew
chmod 0644 /etc/cron.d/certbot-renew
service cron start

echo "Запуск nginx в foreground..."
exec nginx -g "daemon off;"
