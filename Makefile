COMPOSE_FILE := ./srcs/docker-compose.yml

create_dirs:
	mkdir -p ~/data ~/data/wordpressvol

up: create_dirs
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

start: create_dirs
	docker compose -f $(COMPOSE_FILE) start
	
stop:
	docker compose -f $(COMPOSE_FILE) stop

ps:
	docker ps -a

prune:
	docker container prune

