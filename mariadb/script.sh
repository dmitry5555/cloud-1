#!/bin/bash

service mysql start 

mysqld --general-log=1 --general-log-file=/var/log/mysql/mysql.log

DB_EXISTS=$(mysql -e "SHOW DATABASES LIKE '$db_name';" | grep "$db_name" > /dev/null; echo "$?")
USER_EXISTS=$(mysql -e "SELECT User FROM mysql.user WHERE User='$db_user';" | grep "$db_user" > /dev/null; echo "$?")

if [ "$DB_EXISTS" -eq 1 ]; then
    echo "CREATE DATABASE $db_name ;" > db1.sql
    echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
    echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
	mysql < db1.sql
	mysql -u $db_user -p$db_pwd $db_name < /dump.sql
fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld