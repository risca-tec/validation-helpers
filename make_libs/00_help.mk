
.PHONY: help
help:  ## Print current help documentation
	$(Q)echo -e "\n\t$(PURPLE)Makefile usage documentation$(RESET)\n"
	echo "List of main targets:"
	grep --no-filename -E '^[a-z0-9A-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | LANG=C sort \
	    | awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE)%s$(RESET)\t%s\n", $$1, $$2}' $(COLPIPE)
	echo
	echo "List of environment variables:"
	grep --no-filename -E '^[a-zA-Z._-]+ *\?= *[^#]*## .*$$' $(MAKEFILE_LIST) | LANG=C sort | \
	    awk 'match($$0, /([a-zA-Z._-]+) *\?= *([^#]*)## (.*)$$/, var) { \
	        printf "$(BLUE)%s$(RESET)\t$(YELLOW)%s$(RESET)\t%s\n", var[1], var[2], var[3]}' $(COLPIPE) || true
	echo
	echo "Overridden defaults:"
	grep --no-filename -E '^[a-zA-Z._-]+ *\?= *[^#]*## .*$$' $(MAKEFILE_LIST) | LANG=C sort | \
	    awk 'match($$0, /([a-zA-Z._-]+) *\?= *([^#]*)## (.*)$$/, var) { \
	    printf "%s\n", var[1]}' | while read var; do if [ -x $${!var+x} ]; then : ; else printf '"%s" => "%s"\n' "$${var}" "$${!var}"; fi; done
	if [ "$${NESTED_MAKE:-0}" -gt 0 ]; then
	    printf "\n\n$(RED)Nested$(RESET) make shell session\n\n"
	fi
