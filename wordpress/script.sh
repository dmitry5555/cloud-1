#!/bin/bash

mkdir /var/www/
mkdir /var/www/html

# php 
cd /var/www/html
rm -rf *
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php

# wp
curl -O https://wordpress.org/wordpress-6.8.1.tar.gz
tar -xvzf wordpress-6.8.1.tar.gz --strip-components=1
rm wordpress-6.8.1.tar.gz
chown -R www-data:www-data /var/www/html

# 42
#cp -f /up.webp /var/www/html/wp-content/themes/twentytwentyfour/assets/images/building-exterior.webp

# wp-config
cp /wp-config.php /var/www/html/
sed -i "s/ENV_DB_NAME/$DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/ENV_DB_USER/$DB_USER/g" /var/www/html/wp-config.php
sed -i "s/ENV_DB_PASSWORD/$DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/ENV_DB_HOST/$DB_HOST/g" /var/www/html/wp-config.php
sed -i "s/ENV_DB_DOMAIN/$DB_DOMAIN/g" /var/www/html/wp-config.php

# chown www-data:www-data wp-config.php

# chmod 644 /var/www/html/wp-config.php

# php run
/usr/sbin/php-fpm7.3 -F

mkdir /var/www/