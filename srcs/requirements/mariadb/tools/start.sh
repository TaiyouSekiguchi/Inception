#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mysql start
    mysql -u root -e "CREATE DATABASE wordpress_db;"
    mysql -u root -e "CREATE USER 'tsekiguc'@'%' IDENTIFIED BY 'user_password';"
    mysql -u root -e "GRANT ALL ON wordpress_db.* TO 'tsekiguc'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password "root_password"
    service mysql stop
fi

exec /usr/bin/mysqld_safe
