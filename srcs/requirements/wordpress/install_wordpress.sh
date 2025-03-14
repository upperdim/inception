#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root

./wp-cli.phar config create --dbname=${MARIADB_DB} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PW} --dbhost=mariadb --allow-root

./wp-cli.phar core install --url=localhost --title=inception --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PW} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

./wp-cli.phar user create "${WORDPRESS_TEST_USER}" "${WORDPRESS_TEST_EMAIL}" --role=author --user_pass="${WORDPRESS_TEST_PW}" --allow-root

# Run PHP FastCGI Process Manager
# -F forces to run in the background
php-fpm7.4 -F

