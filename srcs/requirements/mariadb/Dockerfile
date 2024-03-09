FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl mariadb-server && rm -rf /var/lib/apt/lists*

RUN apt-get install -y mariadb-server

EXPOSE 3306

CMD ["mysqld"]