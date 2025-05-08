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

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|g' /etc/php/7.3/fpm/pool.d/www.conf && \
    sed -i 's|;listen.allowed_clients|listen.allowed_clients|g' /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

EXPOSE 9000

WORKDIR /usr/share/phpmyadmin

RUN cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php && \
    sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg\['blowfish_secret'\]