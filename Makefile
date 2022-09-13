up		: setup
	cd srcs && docker-compose up -d

down	:
	cd srcs && docker-compose down -v

build	:
	cd srcs && docker-compose build

start	:
	cd srcs && docker-compose start

stop	:
	cd srcs && docker-compose stop

setup	:
	@if [ ! -d "/home/tsekiguc/data/db" ]; then\
		sudo mkdir -m 755 -p /home/tsekiguc/data/db;\
	fi
	@if [ ! -d "/home/tsekiguc/data/wp" ]; then\
		sudo mkdir -p -m 755 /home/tsekiguc/data/wp;\
	fi
	@if ! grep -q "127.0.0.1	tsekiguc.42.fr" /etc/hosts; then\
		sudo chmod 777 /etc/hosts;\
		sudo echo "127.0.0.1	tsekiguc.42.fr" >> /etc/hosts;\
	fi

clean	: down
	-docker rmi `docker images -q`
	-sudo rm -rf /home/tsekiguc/data/db/*
	-sudo rm -rf /home/tsekiguc/data/wp/*

fclean	: clean
	sudo rm -rf /home/tsekiguc
