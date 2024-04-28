#======================================================================
#
# example 'make init'
# example 'make package SKIP_TEST=true ENV=dev'
#
# author: chenlong
# date: 2020-09-27
#======================================================================

SHELL := /bin/bash -o pipefail

export BASE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# ----------------------------- variables <-----------------------------
# unit test flag
SKIP_TEST ?= false
# env
ENV ?= local
# ----------------------------- variables >-----------------------------

# ----------------------------- app.properties <-----------------------------
# app name
APPLICATION_NAME := $(shell grep "app.name" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# jar name
APPLICATION_JAR := $(shell grep "app.name" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')-boot-$(shell grep "app.version" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //').jar
# port
APPLICATION_PORT := $(shell grep "app.port" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# docker.repository.name
DOCKER_REPOSITORY_NAME := $(shell grep "docker.repository.name" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# docker image name
DOCKER_IMAGE_NAME := $(shell grep "docker.image.name" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# docker image tag
DOCKER_IMAGE_TAG := $(shell grep "docker.image.tag" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# docker container name
DOCKER_CONTAINER_NAME := $(shell grep "docker.container.name" $(BASE_PATH)/config/app.properties | cut -d'=' -f2| sed 's/\ //')
# ----------------------------- app.properties >-----------------------------

# ----------------------------- maven <-----------------------------
#
clean:
	$(BASE_PATH)/mvnw --batch-mode --errors -f ${BASE_PATH}/pom.xml clean

#
test:
	$(BASE_PATH)/mvnw --batch-mode --errors --fail-at-end --update-snapshots -f ${BASE_PATH}/pom.xml clean test -D test=*Test -DfailIfNoTests=false

#
package:
	@cat ${BASE_PATH}/deploy/deploy/debugger.sh | \
		sed 's/APPLICATION=[^<]*/APPLICATION=${APPLICATION_NAME}/1' | \
		sed 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${APPLICATION_JAR}/1' \
		> ${BASE_PATH}/deploy/deploy/debugger.sh.newVersion && mv ${BASE_PATH}/deploy/deploy/debugger.sh.newVersion ${BASE_PATH}/deploy/deploy/debugger.sh
	@cat ${BASE_PATH}/deploy/deploy/startup.sh | \
		sed 's/APPLICATION=[^<]*/APPLICATION=${APPLICATION_NAME}/1' | \
		sed 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${APPLICATION_JAR}/1' \
		> ${BASE_PATH}/deploy/deploy/startup.sh.newVersion && mv ${BASE_PATH}/deploy/deploy/startup.sh.newVersion ${BASE_PATH}/deploy/deploy/startup.sh
	@cat ${BASE_PATH}/deploy/deploy/shutdown.sh | \
		sed 's/APPLICATION=[^<]*/APPLICATION=${APPLICATION_NAME}/1' | \
		sed 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${APPLICATION_JAR}/1' \
		> ${BASE_PATH}/deploy/deploy/shutdown.sh.newVersion && mv ${BASE_PATH}/deploy/deploy/shutdown.sh.newVersion ${BASE_PATH}/deploy/deploy/shutdown.sh
	@cat ${BASE_PATH}/deploy/deploy/restart.sh | \
		sed 's/APPLICATION=[^<]*/APPLICATION=${APPLICATION_NAME}/1' | \
		sed 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${APPLICATION_JAR}/1' \
		> ${BASE_PATH}/deploy/deploy/restart.sh.newVersion && mv ${BASE_PATH}/deploy/deploy/restart.sh.newVersion ${BASE_PATH}/deploy/deploy/restart.sh
	$(BASE_PATH)/mvnw --batch-mode --errors --fail-at-end --update-snapshots -f ${BASE_PATH}/pom.xml clean package -P ${ENV} -D maven.test.skip=$(SKIP_TEST)

#
package.uncompress: package
	mkdir -p ${BASE_PATH}/target/app
	tar -zxvf ${BASE_PATH}/target/*.tar.gz -C ${BASE_PATH}/target/app --strip-components 1
# ----------------------------- maven >-----------------------------


# ----------------------------- docker <-----------------------------
docker.init:
	@cat ${BASE_PATH}/deploy/bin/stop.sh | \
		sed 's#DOCKER_CONTAINER_NAME=[^<]*#DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}#1' | \
		sed 's#PROFILE=[^<]*#PROFILE=${ENV}#1' \
		> ${BASE_PATH}/deploy/bin/stop.sh.newVersion && \
		mv ${BASE_PATH}/deploy/bin/stop.sh.newVersion ${BASE_PATH}/deploy/bin/stop.sh
	@cat ${BASE_PATH}/deploy/bin/remove.sh | \
		sed 's#DOCKER_CONTAINER_NAME=[^<]*#DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}#1' | \
		sed 's#PROFILE=[^<]*#PROFILE=${ENV}#1' \
		> ${BASE_PATH}/deploy/bin/remove.sh.newVersion && \
		mv ${BASE_PATH}/deploy/bin/remove.sh.newVersion ${BASE_PATH}/deploy/bin/remove.sh
	@cat ${BASE_PATH}/deploy/bin/run.sh | \
		sed 's#DOCKER_REPOSITORY_NAME=[^<]*#DOCKER_REPOSITORY_NAME=${DOCKER_REPOSITORY_NAME}#1' | \
		sed 's#DOCKER_IMAGE_NAME=[^<]*#DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME}#1' | \
		sed 's#DOCKER_IMAGE_TAG=[^<]*#DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}#1' | \
		sed 's#DOCKER_CONTAINER_NAME=[^<]*#DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}#1' | \
		sed 's#APPLICATION_PORT=[^<]*#APPLICATION_PORT=${APPLICATION_PORT}#1' | \
		sed 's#PROFILE=[^<]*#PROFILE=${ENV}#1' \
		> ${BASE_PATH}/deploy/bin/run.sh.newVersion && \
		mv ${BASE_PATH}/deploy/bin/run.sh.newVersion ${BASE_PATH}/deploy/bin/run.sh

#
docker.build: docker.init package.uncompress
	sh ${BASE_PATH}/deploy/bin/build.sh $(DOCKER_REPOSITORY_NAME) $(DOCKER_IMAGE_NAME) $(DOCKER_IMAGE_TAG) $(ENV)

#
docker.run: docker.build
	sh ${BASE_PATH}/deploy/bin/run.sh $(DOCKER_REPOSITORY_NAME) $(DOCKER_IMAGE_NAME) $(DOCKER_IMAGE_TAG) $(DOCKER_CONTAINER_NAME) $(ENV)
	# docker logs -f $(DOCKER_CONTAINER_NAME)-$(ENV)

#
docker.stop:
	sh ${BASE_PATH}/deploy/bin/stop.sh $(DOCKER_CONTAINER_NAME) $(ENV)

#
docker.remove:
	sh ${BASE_PATH}/deploy/bin/remove.sh $(DOCKER_CONTAINER_NAME) $(ENV)

#
docker.clear:
	docker rm -f $(docker ps -a | grep $(DOCKER_CONTAINER_NAME) | grep -v grep | awk '{ print $1 }')
	docker rmi -f $(docker images | grep $(DOCKER_CONTAINER_NAME) | grep -v grep | awk '{ print $3 }')
# ----------------------------- docker >-----------------------------
