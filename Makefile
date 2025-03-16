COMPOSE_FILE := ./srcs/docker-compose.yml

all: up

create_dirs:
	mkdir -p ~/data ~/data/wordpressvol ~/data/mariadbvol

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

