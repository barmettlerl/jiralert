DOCKER_REPO             ?= github.com/barmettlerl/jiralert
DOCKER_IMAGE_NAME       ?= jiralert


.PHONY: all # Similar to default command for common, but without yamllint
all: precheck style check_license lint unused build test

include Makefile.common
