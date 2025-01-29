
CI ?= false## When running inside bitbucket pipeline this will be set to "true" from environment (required by CICD)

ifdef BITBUCKET_COMMIT
  CICD_RUNTIME=bitbucket
else
  CICD_RUNTIME=local
endif

ifeq ($(CICD_RUNTIME),bitbucket)
  override VERBOSE = 3
endif


ifeq ($(CICD_RUNTIME),bitbucket)
  GIT_BRANCH = $(BITBUCKET_BRANCH)
  GIT_HASH = $(shell echo "$${BITBUCKET_COMMIT:0:7}")
  GIT_TAG = $(BITBUCKET_TAG)
else
  GIT_BRANCH ?= $(shell git rev-parse --abbrev-ref HEAD)
  GIT_HASH ?= $(shell COMMIT="$$(git rev-parse HEAD)" && echo "$${COMMIT:0:7}")
  GIT_TAG ?= $(shell git describe --tags --abbrev=0 HEAD 2>/dev/null || echo "")
endif


.PHONY: cicd.git_refs
cicd.git_refs:
	$(Q)echo Git branch: $(GIT_BRANCH)
	echo Git hash: $(GIT_HASH)
	echo Git tag: $(GIT_TAG)

