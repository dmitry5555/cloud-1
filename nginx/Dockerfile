FROM debian:buster

# Устанавливаем зависимости для nginx и certbot
RUN apt update && apt install -y \
    nginx \
    openssl \
    certbot \
    python3-certbot-nginx \
    # cron

# Создаем директорию для SSL сертификатов
RUN mkdir -p /etc/nginx/ssl

# Копируем конфигурацию Nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Генерация SSL сертификатов с использованием certbot
# Здесь Certbot будет автоматически настраивать сертификат для вашего домена
RUN certbot --nginx -d 217-1141197.hopto.org -d www.217-1141197.hopto.org --non-interactive --agree-tos -m mikrolux@gmail.com

# Команда для старта Nginx и Cron (если нужен для автоматического обновления сертификатов)
COPY ./index.html /usr/share/nginx/html/index.html
RUN chmod +x /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]