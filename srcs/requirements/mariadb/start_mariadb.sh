#!/bin/bash

sed -i "s/\${MARIADB_DB}/${MARIADB_DB}/g" /etc/mysql/init_mariadb.sql
sed -i "s/\${MARIADB_USER}/${MARIADB_USER}/g" /etc/mysql/init_mariadb.sql
sed -i "s/\${MARIADB_PW}/${MARIADB_PW}/g" /etc/mysql/init_mariadb.sql

mysqld

