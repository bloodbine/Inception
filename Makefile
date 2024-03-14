start:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

clean: stop
	if docker volume inspect wordpress >/dev/null 2>&1 ; then docker volume rm -f wordpress
	if docker volume inspect mariadb >/dev/null 2>&1 ; then docker volume rm -f mariadb

setup:
	sudo apt update
	sudo apt install -y make
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	
	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
	  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update