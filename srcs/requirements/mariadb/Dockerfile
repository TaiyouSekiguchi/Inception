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

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["./start.sh"]
