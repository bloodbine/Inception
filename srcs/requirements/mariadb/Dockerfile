FROM debian:bullseye

RUN apt update\
	&& apt install -y mariadb-server\
	&& apt clean

COPY conf/my.cnf /usr/local/bin/my.cnf
COPY conf/database.sql /database.sql
COPY tools/entrypoint.sh /entrypoint.sh

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
