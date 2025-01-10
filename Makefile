NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml

all : down build run

run:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up

run-daemon:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

stop:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} stop

build:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean: down
	docker system prune -a

fclean: down
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)
	rm -rf ~/data

re: fclean all

delete-volumes :
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)

status :

	@echo "\033[44mRunning Containers :${RESET_COLOR}"
	@docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} ps
	@echo ""

	@echo "\033[44mImages :${RESET_COLOR}"
	@docker images
	@echo ""

	@echo "\033[44mContainers :${RESET_COLOR}"
	@docker container ls -a
	@echo ""

	@echo "\033[44mVolumes :${RESET_COLOR}"
	@docker volume ls
	@echo ""

	@echo "\033[44mNetwork :${RESET_COLOR}"
	@docker network ls
	@echo ""


.PHONY: all clean fclean re status stop run run-daemon down build prepare delete-volumes