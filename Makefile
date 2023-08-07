
IMG_NAME=lede-build-env
DIR_WORK=$(shell pwd)/

all: help

help:
	@echo "usage: make { build | up | down | ssh | clean }"

build:
	mkdir -p ./tmp
	cp $(HOME)/.ssh/id_rsa.pub ./tmp/
	docker build -t $(IMG_NAME) .

up:
	docker run -e LOCAL_USER_ID=$(shell id -u $$USER) -itd \
		--add-host host.docker.internal:host-gateway \
		--mount type=bind,source=$(DIR_WORK)/lede,target=/home/vagrant/lede \
		--mount type=bind,source=$(DIR_WORK)/scripts,target=/home/vagrant/scripts \
		--name $(IMG_NAME) \
		$(IMG_NAME) \
		/bin/bash

down:
	docker container stop $(IMG_NAME)
	docker container rm $(IMG_NAME)

startup:
	docker start ${IMG_NAME}

ssh:
	ssh vagrant@$(shell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(IMG_NAME))
	
clean:
	rm -rf tmp/
