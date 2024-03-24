FROM debian:bullseye

RUN apt-get update\
	&& apt-get install -y mariadb-server mariadb-client\
	&& apt-get clean

COPY conf/my.cnf /usr/local/bin/my.cnf
COPY conf/database.sql /database.sql
COPY tools/entrypoint.sh /entrypoint.sh

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN mariadb-install-db --user=root -datadir=/var/lib/mysql --skip-test-db

# EXPOSE 3306
CMD ["sh", "entrypoint.sh"]