# TODO: check for os version to determine the download script on setup

LOCAL_REGISTRY="localhost:5000"

ifeq (, $(shell docker version))
$(error "either docker daemon is not running or docker is not installed")
$(info "check: https://docs.docker.com/get-docker/")
endif

ifeq (, $(shell pack version))
$(error "could not find pack installed in $(PATH)")
$(info "check: https://buildpacks.io/docs/tools/pack/#install")
endif

ifeq (, $(shell skaffold version))
$(error "could not find skaffold installed in $(PATH)")
$(info "check: https://skaffold.dev/docs/install/")
endif

.PHONY: local-build

default: all

all: local-build

local-build:
	$(info ******************** building and pushing to local registry at $(LOCAL_REGISTRY) ********************)
	skaffold build --default-repo $(LOCAL_REGISTRY)
