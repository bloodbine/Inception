FROM debian:bullseye

RUN apt-get update\
	&& apt-get install -y mariadb mariadb-client\
	&& apt-get clean
RUN mkdir /run/mysqld
RUN mkdir /var/lib/mysql
COPY conf/my.conf /usr/local/bin/my.cnf
COPY tools/create-db.sh /create-db.sh
RUN mariadb-install-db --user=root -datadir=/var/lib/mysql --skip-test-db
EXPOSE 3306
CMD [ "exec", "mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/database.sql" ]