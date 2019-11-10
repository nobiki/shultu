.DEFAULT_GOAL := help
.PHONY: help

DOCKER_GID=`cat /etc/group | grep docker | cut -d ":" -f 3`
DOTENV=$(shell cat .env | xargs -IENV echo --build-arg ENV | tr '\n' ' ')

provision:
	mkdir provision
	git init provision/
	git -C provision/ config core.sparsecheckout true
	git -C provision/ remote add origin https://github.com/nobiki/provision
	echo "shell/include" > provision/.git/info/sparse-checkout
	git -C provision/ pull origin master

build:: ## build shultu images
	make provision
	docker-compose build --build-arg DOCKER_GID=${DOCKER_GID} $(DOTENV) shultu | tee build.log

tty: ## run shultu container
	docker-compose run --rm shultu

tty-root: ## run shultu container (root)
	docker-compose run --rm shultu-root

submodule-update:
	git submodule update --init --recursive
	git submodule foreach git pull origin master

vagrant-docker-host:
	cd vagrant-docker-host/
	vagrant up

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


