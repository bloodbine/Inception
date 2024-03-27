cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root
	wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_USER_PWD --dbhost=$DATABASE_HOST --allow-root

	wp core install --url=https://$WEBSITE_DOMAIN/ --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PWD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
	wp theme install astra --activate --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PWD --allow-root --porcelain
	chown -R www-data /var/www/html/*
fi

cp /www.conf /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F