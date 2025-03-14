COMPOSE_FILE := ./srcs/docker-compose.yml

create_dirs:
	mkdir -p ~/data ~/data/wordpress-vol

up: create_dirs
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

start: create_dirs
	docker compose -f $(COMPOSE_FILE) start
	
stop:
	docker compose -f $(COMPOSE_FILE) stop

