FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

WORKDIR /tmp/mariadb

COPY tools .
RUN chmod +x ./setup.sh && \
    chmod +x ./start.sh && \
    ./setup.sh

EXPOSE 3306

CMD ["./start.sh"]
