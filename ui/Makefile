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
ENV ?= prod
#
APPNAME ?= mingsha-template-vue
VERSION ?= v1.0.0
PORT ?= 8080
# ----------------------------- variables >-----------------------------

# ----------------------------- local <-----------------------------
#
install:
	npm install --registry=https://registry.npmmirror.com

#
package:
	npm run build:prod

#
run:
	npm run dev
# ----------------------------- local  >-----------------------------


# ----------------------------- docker <-----------------------------
#
docker.build:
	sh ${BASE_PATH}/deploy/bin/build.sh ${APPNAME} ${VERSION} ${ENV}

#
docker.run: install package docker.build
	sh ${BASE_PATH}/deploy/bin/run.sh ${APPNAME} ${VERSION} ${PORT} ${ENV}
# ----------------------------- docker  >-----------------------------
