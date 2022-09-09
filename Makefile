
up		:
	docker-compose up -d

down	:
	docker-compose down

run		:
	docker-compose run

stop	:
	docker-compose stop

setup	:
	mkdir ~/tsekiguc ~/tsekiguc/data ~/tsekiguc/data/wp ~/tsekiguc/data/db
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1	tsekiguc.42.fr" >> /etc/hosts

clean	: stop
	rm -rf ~/tsekiguc
