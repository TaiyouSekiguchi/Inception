#!/bin/sh

if [ ! -e "/var/www/html/wp-config.php" ] ; then
    wp config create --dbname=wordpress --dbuser=tsekiguc --dbpass=user_password --dbhost=localhost --allow-root
    wp core install --url=url --title=title --admin_user=tsekiguc --admin_passwrod=user_passowrd --admin_email=email --allow-root
    wp user create tsekiguc email --display_name="tsekiguc" --role=editor --user_pass=user_password --allow-root
fi

exec /etc/init.d/php7.3-fpm --nodaemonize
