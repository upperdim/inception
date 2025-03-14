COMPOSE_FILE := ./srcs/docker-compose.yml

create_dirs:
	mkdir -p ~/data ~/data/wordpress-vol

srcs/.env:
	cp srcs/env.env srcs/.env

up: create_dirs srcs/.env
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

start: create_dirs srcs/.env
	docker compose -f $(COMPOSE_FILE) start
	
stop:
	docker compose -f $(COMPOSE_FILE) stop

ps:
	docker ps -a

