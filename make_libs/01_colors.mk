
ifneq ($(origin TERM),undefined)
  ifeq ($(shell command -v tput),/usr/bin/tput)
  BLACK        := $(shell tput -Txterm setaf 0)
  RED          := $(shell tput -Txterm setaf 1)
  GREEN        := $(shell tput -Txterm setaf 2)
  YELLOW       := $(shell tput -Txterm setaf 3)
  LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
  PURPLE       := $(shell tput -Txterm setaf 5)
  BLUE         := $(shell tput -Txterm setaf 6)
  WHITE        := $(shell tput -Txterm setaf 7)
  RESET        := $(shell tput -Txterm sgr0)
  else
    $(info for colors install ncurses-bin)
    BLACK        := ""
    RED          := ""
    GREEN        := ""
    YELLOW       := ""
    LIGHTPURPLE  := ""
    PURPLE       := ""
    BLUE         := ""
    WHITE        := ""
    RESET        := ""
  endif
else
  BLACK        := ""
  RED          := ""
  GREEN        := ""
  YELLOW       := ""
  LIGHTPURPLE  := ""
  PURPLE       := ""
  BLUE         := ""
  WHITE        := ""
  RESET        := ""
endif

.PHONY: colors
colors: # show all colors
	$(Q)echo "${BLACK}BLACK${RESET}"
	echo "${RED}RED${RESET}"
	echo "${GREEN}GREEN${RESET}"
	echo "${YELLOW}YELLOW${RESET}"
	echo "${LIGHTPURPLE}LIGHTPURPLE${RESET}"
	echo "${PURPLE}PURPLE${RESET}"
	echo "${BLUE}BLUE${RESET}"
	echo "${WHITE}WHITE${RESET}"

