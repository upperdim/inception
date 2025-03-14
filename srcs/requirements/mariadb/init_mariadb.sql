CREATE DATABASE IF NOT EXISTS ${MARIADB_DB};

--------------------------------------------------------------------------------
-- Create user accessible from any host (eg. localhost) using wildcard (%)
--------------------------------------------------------------------------------
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PW}';

--------------------------------------------------------------------------------
-- Grant ALL PRIVILEGES on all databases (*.*)
-- with ability to give permissions to other users (WITH GRANT OPTION)
--------------------------------------------------------------------------------
GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;

--------------------------------------------------------------------------------
-- Force database server to reload privilege table so changes take effect
--------------------------------------------------------------------------------
FLUSH PRIVILEGES;

