FROM debian:bullseye

RUN apt-get update\
	&& apt-get install -y mariadb mariadb-client\
	&& apt-get clean

COPY conf/my.cnf /usr/local/bin/my.cnf
COPY conf/database.sql /
COPY tools/entrypoint.sh /entrypoint.sh

RUN mkdir /run/mysqld
RUN mkdir /var/lib/mysql
RUN mariadb-install-db --user=root -datadir=/var/lib/mysql --skip-test-db

EXPOSE 3306
ENTRYPOINT [ "" ]
CMD [ "exec", "mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/database.sql" ]