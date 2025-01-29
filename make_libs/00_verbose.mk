
VERBOSE ?= 0## Set verbose level (0: no, 1: print target, 2: shell verbose, 3: both)

ifeq ($(VERBOSE),$(filter $(VERBOSE),2 3))
  .SHELLFLAGS = -e -o pipefail -u -x -c
endif
ifeq ($(VERBOSE),$(filter $(VERBOSE),1 3))
  Q :=
else
  Q := @
endif

