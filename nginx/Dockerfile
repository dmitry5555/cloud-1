FROM debian:buster-slim

RUN apt update && apt install -y \
    nginx \
    openssl \
    certbot \
    python3-certbot-nginx \
    cron \
    curl

RUN mkdir -p /var/www/html
RUN mkdir -p /etc/nginx/ssl

COPY ./nginx-init.conf /etc/nginx/nginx-init.conf
COPY ./nginx-ssl.conf /etc/nginx/nginx-ssl.conf
COPY ./index.html /var/www/html/index.html

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
