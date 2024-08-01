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
APPNAME ?= mingsha-template-vue-ui
VERSION ?= 1.0.0
PORT ?= 8000
HELM_NAMESPACE ?= mingsha
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
docker.build: install package
	sh ${BASE_PATH}/deploy/bin/docker/build.sh ${APPNAME} ${VERSION} ${ENV}

#
docker.run: install package docker.build
	sh ${BASE_PATH}/deploy/bin/docker/run.sh ${APPNAME} ${VERSION} ${PORT} ${ENV}
# ----------------------------- docker  >-----------------------------

# ----------------------------- helm <-----------------------------
#
helm.uninstall:
	sh ${BASE_PATH}/deploy/bin/helm/uninstall.sh $(APPNAME) $(HELM_NAMESPACE) $(ENV)

#
helm.upgrade: docker.build helm.uninstall
	sh ${BASE_PATH}/deploy/bin/helm/install.sh $(APPNAME) $(HELM_NAMESPACE) $(ENV)
# ----------------------------- helm  >-----------------------------
