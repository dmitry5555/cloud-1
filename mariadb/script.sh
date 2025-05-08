#!/bin/bash

service mysql start 

mysqld --general-log=1 --general-log-file=/var/log/mysql/mysql.log

# DB_EXISTS=$(mysql -e "SHOW DATABASES LIKE '$DB_NAME';" | grep "$DB_NAME" > /dev/null; echo "$?")
# USER_EXISTS=$(mysql -e "SELECT User FROM mysql.user WHERE User='$DB_USER';" | grep "$DB_USER" > /dev/null; echo "$?")

# if [ "$DB_EXISTS" -eq 1 ]; then
#     echo "CREATE DATABASE $DB_NAME ;" > db1.sql
#     echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
#     echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
# 	mysql < db1.sql
# 	mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < /dump.sql
# fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld