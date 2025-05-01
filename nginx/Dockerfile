FROM debian:buster

# Устанавливаем зависимости для nginx и certbot
RUN apt update && apt install -y \
    nginx \
    openssl \
    certbot \
    python3-certbot-nginx \
    cron

# Создаем директорию для веб-контента и SSL
RUN mkdir -p /var/www/html
RUN mkdir -p /etc/nginx/ssl

# Копируем временную конфигурацию Nginx (без SSL)
COPY ./nginx-init.conf /etc/nginx/nginx-init.conf
COPY ./nginx-ssl.conf /etc/nginx/nginx-ssl.conf
COPY ./index.html /var/www/html/index.html

# Копируем скрипт запуска
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Запуск скрипта при старте контейнера
CMD ["/start.sh"]


# FROM nginx:cloud-1

# # Копируем конфигурационный файл
# COPY nginx-init.conf /etc/nginx/nginx.conf

# # Expose порты
# EXPOSE 80

# # Запускаем Nginx
# CMD ["nginx", "-g", "daemon off;"]