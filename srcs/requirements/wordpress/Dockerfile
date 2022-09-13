FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.3 \
    php-fpm \
    php-cli \
    php-mysql \
    php-mbstring \
    php-xml \
    php-mysqli \
    mariadb-client \
    curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /run/php/;

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

WORKDIR /var/www/wordpress
COPY tools/start.sh .
RUN chmod 777 ./start.sh

ENTRYPOINT ["/tini", "--"]

CMD [ "./start.sh" ]
