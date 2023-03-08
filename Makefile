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

re:	prune load

clean:
	docker stop $(shell docker ps -qa) || true
	docker rm $(shell docker ps -qa) || true
	docker rmi -f $(shell docker images -qa) || true
	docker volume rm $(shell docker volume ls -q) || true
	docker network rm $(shell docker network ls -q) || true

PHONY: all load down prune clean re
