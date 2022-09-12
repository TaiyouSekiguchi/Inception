up		:
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
	if [ ! -d "~/tsekiguc/data/db" ]; then\
		mkdir -m 755 -p ~/tsekiguc/data/db;\
	fi
	if [ ! -d "~/tsekiguc/data/wp" ]; then\
		mkdir -p -m 755 ~/tsekiguc/data/wp;\
	fi
	if ! grep -q "127.0.0.1	tsekiguc.42.fr" /etc/hosts; then\
		sudo chmod 777 /etc/hosts;\
		sudo echo "127.0.0.1	tsekiguc.42.fr" >> /etc/hosts;\
	fi

clean	: down
	docker rmi `docker images -q`
	rm -rf ~/tsekiguc/data/db/*
	rm -rf ~/tsekiguc/data/wp/*
