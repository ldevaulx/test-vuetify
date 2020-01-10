.DEFAULT_GOAL := all
CIRCLE_TAG    ?= $(CIRCLE_SHA1)
VUE           := vue
DOCKER_ENV    := $(shell test -f /.dockerenv && echo -n true)
ENV           ?= dev
FIG           := docker-compose
FIGFLAGS      := -f docker/docker-compose.yml

ifneq ($(CIRCLE_TAG),)
	TAG := $(CIRCLE_TAG)
else
	TAG := dev
endif
VERSION := $(TAG)

#########################
# vue-cli arguments
#########################
ifeq (vue,$(firstword $(MAKECMDGOALS)))
	# use the rest as arguments for "vue"
	VUE_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
	# ...and turn them into do-nothing targets
    $(eval $(VUE_ARGS):;@:)
endif

#########################
# VUE
#########################
.PHONY: vue
vue:
	@$(FIG) $(FIGFLAGS) exec nodejs $(VUE) $(VUE_ARGS)

#########################
# UP
#########################
.PHONY: up
up:
	@echo
ifneq ($(DOCKER_ENV),true)
	$(FIG) $(FIGFLAGS) up -d
endif

#########################
# SERVE
#########################
.PHONY: serve
serve:
ifneq ($(DOCKER_ENV),true)
	$(FIG) $(FIGFLAGS) up -d
	@$(FIG) $(FIGFLAGS) exec -d nodejs $(MAKE) $@
else
	@echo
	sh -c "yarn serve > /proc/1/fd/1"
endif

#########################
# SH
#########################
.PHONY: sh
sh:
ifneq ($(DOCKER_ENV),true)
	$(FIG) $(FIGFLAGS) exec nodejs bash
endif

#########################
# LOGS
#########################
.PHONY: logs
logs:
ifneq ($(DOCKER_ENV),true)
	$(FIG) $(FIGFLAGS) logs -f -t nodejs
endif

#########################
# STOP
#########################
.PHONY: stop
stop:
	@echo
ifneq ($(DOCKER_ENV),true)
	$(FIG) $(FIGFLAGS) stop
endif






