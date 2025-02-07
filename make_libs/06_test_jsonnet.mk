
TEST := tests
TEST_VENDOR := $(TEST)/vendor

$(TEST_VENDOR): $(TEST)/jsonnetfile.lock.json  ## Populate jsonnet vendor directory (using lock file)
	$(Q)cd $(TEST)
	jb install

.PHONY: test.vendor.update
test.vendor.update:  ## Update vendor data as defined upon jsonnetfile.json (WARNING: could be disruptive!)
	$(Q)cd $(TEST)
	jb update

.PHONY: test.jsonnet
test.jsonnet:  $(VENDOR) $(TEST_VENDOR)  ## Run unittest via jsonnet
	$(Q)jsonnet -J $(VENDOR) -J $(TEST_VENDOR) -J $(DIR_LIB) $(TEST)/main.libsonnet
