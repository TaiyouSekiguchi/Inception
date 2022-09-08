FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.3 \
    php-fpm \
    php-cli \
    wget \
    curl \
    php-mysql \
    php-mbstring \
    php-xml \
    sendmail \
    mariadb-client && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv /wordpress/* /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    rm -r /wordpress/ latest.tar.gz && \
    rm -f /var/www/html/wp-config-sample.php && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir /var/run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

WORKDIR /var/www/html
COPY tools/start.sh .
RUN chmod +x ./start.sh

EXPOSE 9000

ENTRYPOINT ["/tini", "--"]

CMD ["./start.sh"]
