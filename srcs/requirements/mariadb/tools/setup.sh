#!/bin/sh

sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/bind-address/# bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
