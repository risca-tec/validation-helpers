
# TEST see 06__test_jsonnet.mk
.PHONY: test.bats
test.bats:  $(VENDOR) $(TEST_VENDOR)  ## Run unittest via bats
	$(Q)bats ./$(TEST)/bat_test
