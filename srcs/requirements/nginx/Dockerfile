FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server_pkey.pem \
    -out /etc/ssl/certs/server.crt \
    -subj "/C=JP/ST=Tokyo/L=Minato-ku/O=FT, Inc./CN=FT"

COPY conf/default /etc/nginx/sites-available/default

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
