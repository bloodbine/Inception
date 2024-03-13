FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y php-fpm php-mysql curl mariadb-client \
	&& apt-get clean

COPY ./conf/ /

RUN chmod +x /wordpress-setup.sh

# EXPOSE 9000