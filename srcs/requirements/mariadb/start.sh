#!/bin/bash

INIT_FILE="/create_db.sql"

sed -i "s/\${MARIADB_DB}/${MARIADB_DB}/g" "$INIT_FILE"
sed -i "s/\${MARIADB_USER}/${MARIADB_USER}/g" "$INIT_FILE"
sed -i "s/\${MARIADB_PW}/${MARIADB_PW}/g" "$INIT_FILE"

echo "Starting MySQL daemon..."
mysqld &
MYSQL_PID=$!

echo "Waiting for MySQL to be ready..."
until mysqladmin ping; do
    sleep 1
done

echo "Creating database..."
mysql -uroot -ppass < "$INIT_FILE"
echo "Database created."

# Keep the daemon running
wait "$MYSQL_PID"

