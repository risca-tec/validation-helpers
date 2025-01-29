
ifeq ($(shell command -v column >/dev/null && echo 1 || echo 0),1)
  COLPIPE = | column -t -s $$'\t'
else
  COLPIPE =
endif


#>This script will check that the current ``GNU Make`` version is at least version 4.
MAKE_VERSION_TARGET = 4.%
ifeq ($(filter $(MAKE_VERSION_TARGET),$(MAKE_VERSION)),)
#>If not, an error is raised.
  $(error Please use GNUmake version $(MAKE_VERSION_TARGET))
endif


#>*************************
#>macro utils.check_defined
#>*************************
#>
#>This macro check if a variable is defined. If not is raised an error with the provided message.
#>
#>Parameters
#>
#>1. Variable name(s) to be test.
#>2. (optional) Error message to print.
#>
#>Example:
#>
#>.. code:: make
#>
#>   $(call utils.check_defined, MYVAR, must be defined and not empty)
utils.check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
        $(error Undefined $1$(if $2, ($2))))


#>
#>*******************************
#>How to preserve trailing spaces
#>*******************************
#>
#>Makefile will eat any leading space or tab. Therefore if leading spaces are required, it is possible to preserve them using a plaseholder such as in the following example:
#>
#>.. code:: make
#>
#>   target:
#>      echo "multiline
#>      $(E)    with four leading spaces"
E := $$(echo "")


#>
#>************************************
#>Target environment variable required
#>************************************
#>
#>This dynamic target will check if the named variable exists. If not an error is raised.
#>Example:
#>
#>.. code:: make
#>
#>   mytarget: | env-CUSTOMVAR
#>   ·  echo $${CUSTOMVAR}
env-%:
	$(Q)test -n "${$*}" || (echo "Variable $(RED)\"$*\"$(RESET) is not set"; exit 1)

