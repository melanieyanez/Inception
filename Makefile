NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml

all : down build run
	@echo "Project ${NAME} is up and running!"

run:
	@echo "Starting ${NAME} in interactive mode..."
	@docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up || echo "Containers stopped cleanly."

run-daemon:
	@echo "Starting ${NAME} in detached mode..."
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	@echo "Stopping and removing all containers for ${NAME}..."
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

stop:
	@echo "Stopping all containers for ${NAME} without removing them..."
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} stop

build:
	@echo "Building Docker images for ${NAME}..."
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean: down
	@echo "Cleaning up unused Docker resources..."
	docker system prune -a

fclean: down
	@echo "Performing a full cleanup, including unused volumes..."
	docker system prune -a --volumes

re: fclean all
	@echo "Project ${NAME} has been rebuilt from scratch!"


delete-volumes:
	@echo "Deleting all unused Docker volumes..."
	docker system prune -a --volumes -f

status:
	@echo "Checking the status of ${NAME} resources..."
	@echo "Running Containers:"
	@docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} ps
	@echo ""

	@echo "Images:"
	@docker images
	@echo ""

	@echo "Containers:"
	@docker container ls -a
	@echo ""

	@echo "Volumes:"
	@docker volume ls
	@echo ""

	@echo "Network:"
	@docker network ls

.PHONY: all clean fclean re status stop run run-daemon down build prepare delete-volumes