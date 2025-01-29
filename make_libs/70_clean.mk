
.PHONY: clean
clean:
	for dir_ in charts tmp vendor; do
	    [ ! -d $${dir_} ] || rm -rf "$${dir_}"
	done
