FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y nginx openssl \
	&& apt-get clean \
	&& mkdir /etc/nginx/ssl/

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY conf/nginx-entry.sh .

ENTRYPOINT [ "./nginx-entry.sh" ]

CMD ["nginx", "-g", "daemon off;"]
