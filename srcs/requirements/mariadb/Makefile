build	:
	docker build -t mariadb .

test	:
	docker run -e DB_NAME=wordpress_db -e DB_USER=tsekiguc -e DB_PASSWORD=user_password -e DB_ROOT_PASSWORD=root_password -it -d --name mariadb-1 -p 3306:3306 mariadb

stop	:
	docker stop mariadb-1

clean	:
	docker rm mariadb-1

fclean	: clean
	docker rmi mariadb

re		: fclean all
