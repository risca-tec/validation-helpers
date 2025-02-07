#!/usr/bin/env bats

setup() {
    load test_helper.bash
    bats_load_library bats-support
    bats_load_library bats-assert
}


# bats file_tags=value:literal

@test "literal not valid" {
    run jsonnet_run_main "m.value.literal('some', ['other', 'more'])"
    [ "${status}" -eq 1 ]
    assert_regex "${output}" "RUNTIME ERROR: Only allowed values are: other, more"

    run jsonnet_run_main "m.value.literal('some', ['other', 'more'], message='this will fail')"
    [ "${status}" -eq 1 ]
    assert_regex "${output}" \
        "RUNTIME ERROR: this will fail -> Only allowed values are: other, more"
}

@test "literal valid" {
    run jsonnet_run_main \
        "m.value.literal('other', ['other', 'more'], message='this will fail')"
    [ "${status}" -eq 0 ]
    assert_regex "${output}" "other"

    run jsonnet_run_main \
        "m.value.literal('more', ['other', 'more'])"
    [ "${status}" -eq 0 ]
    assert_regex "${output}" "more"
}
