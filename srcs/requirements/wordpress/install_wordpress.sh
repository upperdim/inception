#!/bin/bash


cd /var/www/html


# If wp-cli doesn't exists, download it
if [ ! -f wp-cli.phar ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
fi


# If wordpress doesn't exists, download it
if [ ! -f wp-load.php ]; then
	echo "Wordpress: Downloading..."
	./wp-cli.phar core download --allow-root
else
	echo "Wordpress: Already downloaded."
fi


echo "Waiting for MySQL to be ready..."
until mysqladmin ping -h mariadb -uroot -ppass --silent; do
    sleep 2
done

#echo "Waiting for MariaDB to be ready..."
#until mysqladmin ping -h "${MYSQL_DB_HOST}" -u root --password="${MYSQL_ROOT_PASSWORD}" --silent; do
#    sleep 1
#done


echo "Wordpress: Creating config..."
./wp-cli.phar config create	--dbname="$MARIADB_DB" \
							--dbuser="$MARIADB_USER" \
							--dbpass="$MARIADB_PW" \
							--dbhost="mariadb" \
							--allow-root


echo "Wordpress: Installing..."
./wp-cli.phar core install	--url=localhost \
							--title=inception \
							--admin_user="$WORDPRESS_ADMIN_USER" \
							--admin_password="$WORDPRESS_ADMIN_PW" \
							--admin_email="$WORDPRESS_ADMIN_EMAIL" \
							--allow-root


echo "Wordpress: Creating test user..."
./wp-cli.phar user create	"$WORDPRESS_TEST_USER" \
							"$WORDPRESS_TEST_EMAIL" \
							--role=author \
							--user_pass="$WORDPRESS_TEST_PW" \
							--allow-root


echo "Wordpress: Setup done"


# Run PHP FastCGI Process Manager
# -F forces to run in the background
php-fpm7.4 -F

