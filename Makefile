#!/usr/bin/make -f
.ONESHELL:
.SHELLFLAGS = -e -o pipefail -u -c
SHELL := bash
MAKEFLAGS += --warn-undefined-variables

.DEFAULT_GOAL := help

DIR_REPO := $(shell dirname $(realpath $(MAKEFILE_LIST)))

#>and finally all makefiles dependencies are imported.
include $(DIR_REPO)/make_libs/*.mk

