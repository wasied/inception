all: load

down:
	cd srcs; docker-compose down --remove-orphans --volumes

prune:	down
	docker system prune -af --volumes

load:
	mkdir -p /home/mpeharpr/data/
	mkdir -p /home/mpeharpr/data/wordpress
	mkdir -p /home/mpeharpr/data/mariadb
	cd srcs; docker-compose up -d --build

clean:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null

PHONY: all load down prune clean
