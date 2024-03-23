start:
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	if docker volume inspect wordpress >/dev/null 2>&1 ; then docker volume rm -f wordpress ; fi
	if docker volume inspect mariadb >/dev/null 2>&1 ; then docker volume rm -f mariadb ; fi
