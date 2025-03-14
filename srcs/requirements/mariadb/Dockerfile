# mariadb Dockerfile

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

# Copy configuration file with user set,
# datadir and tmpdir uncommented, bind-address and init-file set
COPY 50-server.cnf /etc/mysql/mariadb.d

# Copy the script that creates mariadb databases
COPY init_mariadb.sql /etc/mysql/init_mariadb.sql

# mariadb expects this directory to run the socket inside
RUN mkdir -p /run/mysqld

# This script does environment variable substitutions on above script
# and then runs mariadb 
# which will run above scripts as init_file
COPY start_mariadb.sh /start_mariadb.sh
RUN chmod +x /start_mariadb.sh

CMD ["/start_mariadb.sh"]

