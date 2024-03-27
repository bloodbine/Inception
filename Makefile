start:
	mkdir -p /home/gpasztor/data /home/gpasztor/data/mariadb_data /home/gpasztor/data/wordpress_data
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	docker rmi -f srcs-mariadb srcs-wordpress srcs-nginx
	docker volume rm -f srcs_mariadb_data srcs_wordpress_data
	docker network rm -f srcs_inception
	sudo rm -rf /home/gpasztor/data*
