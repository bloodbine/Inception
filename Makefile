start:
	mkdir -p /home/gpasztor/data /home/gpasztor/data/mariadb_data /home/gpasztor/data/wordpress_data
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	docker rmi -f inception-mariadb inception-wordpress inception-nginx
	docker volume rm -f inception_mariadb_data inception_wordpress_data
	docker network rm -f inception_inception
	sudo rm -rf /home/gpasztor/data*
