FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx.key -out /etc/nginx.crt -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/CN=gpasztor.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 9000 443

CMD ["nginx", "-g", "daemon off;"]
