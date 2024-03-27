start:
	mkdir -p /home/gpasztor/data /home/gpasztor/data/mariadb_data /home/gpasztor/data/wordpress_data
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null
