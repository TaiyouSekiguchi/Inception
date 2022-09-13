#!/bin/sh

chown -R mysql:mysql /var/lib/mysql
if ! [ -d "/var/lib/mysql/wordpress" ]; then
    service mysql start
    for i in {30..1}; do
        if echo 'SELECT 1' | mysql -u root &> /dev/null; then
            break
        fi
        sleep 1
    done
    if [ "$i" = 0 ]; then
        exit 1
    fi
    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_ROOT_PASSWORD
    service mysql stop
fi

exec /usr/bin/mysqld_safe
