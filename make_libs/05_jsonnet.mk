
$(VENDOR): jsonnetfile.lock.json  ## Populate jsonnet vendor directory (using lock file)
	$(Q)jb install

.PHONY: vendor.update
vendor.update:  ## Update vendor data as defined upon jsonnetfile.json (WARNING: could be disruptive!)
	$(Q)jb update

