
jsonnet_run() {
    local exec_text="${1}"
    jsonnet -J vendor -J validation-helpers -e "${exec_text}"
}

jsonnet_run_main() {
    local exec_text="${1}"
    jsonnet -J vendor -J validation-helpers -e "
local m = import 'main.libsonnet';

${exec_text}
"
}

