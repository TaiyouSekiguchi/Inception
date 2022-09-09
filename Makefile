
mkdir	:
	mkdir ~/tsekiguc ~/tsekiguc/data ~/tsekiguc/data/wp ~/tsekiguc/data/db

setup	: mkdir
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1	tsekiguc.42.fr" >> /etc/hosts

clean	:
	rm -rf ~/tsekiguc
