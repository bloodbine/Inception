start:
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	if docker volume inspect srcs_wordpress_data >/dev/null 2>&1 ; then docker volume rm -f srcs_wordpress_data ; fi
	if docker volume inspect srcs_mariadb_data >/dev/null 2>&1 ; then docker volume rm -f srcs_mariadb_data ; fi
	rm -rf srcs/requirements/wordpress/data/*
	touch srcs/requirements/wordpress/data/.gitkeep
	rm -rf srcs/requirements/mariadb/data/*
	touch srcs/requirements/mariadb/data/.gitkeep