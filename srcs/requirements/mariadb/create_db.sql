CREATE DATABASE IF NOT EXISTS ${MARIADB_DB};

--------------------------------------------------------------------------------
-- Create user accessible from any host (eg. localhost) using wildcard (%)
--------------------------------------------------------------------------------
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PW}';

--------------------------------------------------------------------------------
-- Grant ALL PRIVILEGES on database
-- with ability to give permissions to other users (WITH GRANT OPTION)
--------------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON ${MARIADB_DB}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;


--------------------------------------------------------------------------------
-- Change root password
--------------------------------------------------------------------------------
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MARIADB_ROOT_PW}');


--------------------------------------------------------------------------------
-- Force database server to reload privilege table so changes take effect
--------------------------------------------------------------------------------
FLUSH PRIVILEGES;

