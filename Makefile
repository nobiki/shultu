.DEFAULT_GOAL := help
.PHONY: help

DOCKER_GID=`cat /etc/group | grep docker | cut -d ":" -f 3`
DOTENV=$(shell cat .env | xargs -IENV echo --build-arg ENV | tr '\n' ' ')

build:: ## build shultu images
	docker-compose build --force-rm --no-cache --build-arg DOCKER_GID=${DOCKER_GID} $(DOTENV) | tee build.log

tty: ## run shultu container
	# docker run -it --rm shultu
	docker-compose run --rm shultu

submodule-update:
	git submodule update --init --recursive
	git submodule foreach git pull origin master

vagrant-docker-host:
	cd vagrant-docker-host/
	vagrant up

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


