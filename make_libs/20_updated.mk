
github_tag_latest = git ls-remote --refs --sort="version:refname" --tags https://github.com/$(1)/$(2).git | cut -d/ -f3- | tail -n1

.PHONY: is_updated
is_updated: is_updated.jb is_updated.tk ## Check update availabilities
	$(Q)

.PHONY: is_updated.tk
is_updated.tk:  ## Check update availabilities
	$(Q)CURRENT="$$(tk --version 2>&1 | cut -f5 -d' ')"
	UPSTREAM="$$($(call github_tag_latest,grafana,tanka))"
	if [ "$${CURRENT}" == "$${UPSTREAM}" ]; then
	    echo "Tanka is updated"
	else
	    echo "Found new tanka version!"
	    echo "Current: $${CURRENT}"
	    echo "Latest: $${UPSTREAM}"
	    echo "Check upstream for release: https://github.com/grafana/tanka/releases"
	fi

.PHONY: is_updated.jb
is_updated.jb:  ## Check update availabilities
	$(Q)CURRENT="v$$(jb --version 2>&1)"
	UPSTREAM="$$($(call github_tag_latest,jsonnet-bundler,jsonnet-bundler))"
	if [ "$${CURRENT}" == "$${UPSTREAM}" ]; then
	    echo "Jsonnet Bundler is updated"
	else
	    echo "Found new Jsonnet bundler version!"
	    echo "Current: $${CURRENT}"
	    echo "Latest: $${UPSTREAM}"
	fi
