#!/bin/bash
set -ex

# # Проверка наличия переменной HOST_DOMAIN 
# if [ -z "$HOST_DOMAIN" ]; then
#   echo "ERROR: Переменная HOST_DOMAIN не установлена"
#   HOST_DOMAIN="example.com" # значение по умолчанию
#   echo "Используем домен по умолчанию: $HOST_DOMAIN"
# fi

echo "Используется домен: $HOST_DOMAIN"

# Заменяем домен в конфигурации
sed -i "s/\${HOST_DOMAIN}/$HOST_DOMAIN/g" /etc/nginx/nginx-init.conf
sed -i "s/\${HOST_DOMAIN}/$HOST_DOMAIN/g" /etc/nginx/nginx-ssl.conf

# Старт: временная конфигурация nginx (без SSL)
echo "Старт: временная конфигурация nginx (без SSL)..."
cp /etc/nginx/nginx-init.conf /etc/nginx/nginx.conf
nginx

# Проверка, что локальный nginx отвечает
curl -I http://localhost || echo "Локальный nginx не отвечает"

# Проверка наличия сертификата и получение через certbot, если необходимо
if [ -f "/etc/letsencrypt/live/$HOST_DOMAIN/fullchain.pem" ]; then
  echo "Сертификат уже существует, пропускаем выдачу."
else
  echo "Получение SSL через certbot для домена $HOST_DOMAIN..."
  # Проверяем, содержит ли домен точку (требование Let's Encrypt)
  if [[ "$HOST_DOMAIN" == *.* ]]; then
    certbot --nginx -d "$HOST_DOMAIN" --non-interactive --agree-tos -m mikrolux@gmail.com
  else
    echo "ОШИБКА: Домен $HOST_DOMAIN не может быть использован для SSL (нужна как минимум одна точка)"
  fi
fi

# Установка основного SSL-конфига nginx
echo "Установка основного SSL-конфига nginx..."
cp /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

# Остановка старого процесса nginx
echo "Остановка старого процесса nginx..."
nginx -s stop || true

# Настройка автоматического продления сертификата
echo "Настройка автоматического продления сертификата..."
echo "0 3 * * * root certbot renew --quiet && nginx -s reload" > /etc/cron.d/certbot-renew
chmod 0644 /etc/cron.d/certbot-renew
cron

# Запуск nginx в foreground
echo "Запуск nginx в foreground..."
exec nginx -g "daemon off;"