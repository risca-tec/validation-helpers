

.PHONY: doc
doc: validation-helpers/README.md ## Generate library new README

DOC_DEPS = $(shell find $(DIR_LIB) -type f -regex '.*\/[a-zA-Z\-]*\.libsonnet')
$(DIR_LIB)/README.md: $(DOC_DEPS) $(VENDOR) ## Generate library new README
	$(Q)if ! command -v jsonnet >/dev/null ; then
	    echo "$(RED)Binary jsonnet missing$(RESET)"
	    exit 1
	fi
	jsonnet -J $(VENDOR)/ -J . -S -m $(DIR_LIB) $(DIR_LIB)/docs.jsonnet
