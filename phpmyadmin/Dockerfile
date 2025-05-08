FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    php-fpm \
    php-mysqli \
    php-json \
    php-common \
    php-mbstring \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O /tmp/phpmyadmin.zip && \
    unzip /tmp/phpmyadmin.zip -d /usr/share/ && \
    mv /usr/share/phpMyAdmin-* /usr/share/phpmyadmin && \
    rm /tmp/phpmyadmin.zip

RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.3/fpm/php-fpm.conf

EXPOSE 9000

WORKDIR /usr/share/phpmyadmin

CMD ["php-fpm7.3", "-F"]