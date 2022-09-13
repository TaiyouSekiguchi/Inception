#!/bin/sh

wp core is-installed --allow-root 2> /dev/null
if [ $? -ne 0 ]; then
    wp core download --allow-root

    wp config create \
        --dbhost=${DB_HOST} \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --allow-root \
        --skip-check

    wp core install \
        --url=${DOMAIN_NAME} \
        --title=${TITLE} \
        --admin_user=${ADMIN_USER} \
        --admin_password=${DB_ROOT_PASSWORD} \
        --admin_email=${ADMIN_EMAIL} \
        --skip-email \
        --allow-root

    wp user create \
        ${DB_USER} \
        ${USER_EMAIL} \
        --user_pass=${DB_PASSWORD} \
        --allow-root \
        --role=editor

    chown -R www-data:www-data *
    chmod -R 775 /var/www/*
fi

exec /usr/sbin/php-fpm7.3 --nodaemonize
