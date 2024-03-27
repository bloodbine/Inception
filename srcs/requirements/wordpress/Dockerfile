FROM debian:bullseye

RUN apt update \
	&& apt install -y php-fpm php-mysql curl mariadb-client \
	&& apt clean

COPY ./conf/wordpress-setup.sh /wordpress-setup.sh
COPY ./conf/www.conf /www.conf

RUN chmod +x /wordpress-setup.sh

ENTRYPOINT ["./wordpress-setup.sh"]
