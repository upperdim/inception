# mariadb Dockerfile

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

# mariadb expects this directory to run the socket inside
RUN mkdir -p /run/mysqld /var/lib/mysqld && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY create_db.sql /create_db.sql
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3306

CMD ["/start.sh"]

