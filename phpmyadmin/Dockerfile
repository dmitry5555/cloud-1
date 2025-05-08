FROM debian:buster-slim

# Установка необходимых пакетов
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

# Загрузка и установка phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O /tmp/phpmyadmin.zip && \
    unzip /tmp/phpmyadmin.zip -d /usr/share/ && \
    mv /usr/share/phpMyAdmin-* /usr/share/phpmyadmin && \
    rm /tmp/phpmyadmin.zip

# Настройка PHP-FPM
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.3/fpm/php-fpm.conf && \
    sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|g' /etc/php/7.3/fpm/pool.d/www.conf

# Создание необходимой директории для PHP-FPM
RUN mkdir -p /run/php

# Настройка phpMyAdmin (blowfish_secret)
WORKDIR /usr/share/phpmyadmin
RUN cp config.sample.inc.php config.inc.php && \
    sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg\['blowfish_secret'\] = 'somesecretphrase';/" config.inc.php

# Открытие порта 9000
EXPOSE 9000

# Команда запуска PHP-FPM
CMD ["php-fpm7.3", "-F"]