#!/usr/bin/env bats

setup() {
    load test_helper.bash
    bats_load_library bats-support
    bats_load_library bats-assert
}


# bats file_tags=value:arrays

# bats test_tags=value:array
@test "array not valid" {
    run jsonnet_run_main "m.value.array(null)"
    assert_failure
    assert_regex "${output}" \
        "RUNTIME ERROR: Only array type is valid, got \(null\)"

    run jsonnet_run_main "m.value.array({}, message='this will fail')"
    assert_failure
    assert_regex "${output}" \
        "RUNTIME ERROR: this will fail -> Only array type is valid, got \(object\)"
}

# bats test_tags=value:array
@test "array valid" {
    run jsonnet_run_main \
        "std.join(',', m.value.array(['other', 'more'], message='this will not fail'))"
    assert_success
    assert_regex "${output}" "other,more"

    run jsonnet_run_main \
        "m.value.array([])"
    assert_success
    assert_regex "${output}" "\[ *\]"
}

# bats test_tags=value:arrayOfString
@test "arrayOfStrings not valid" {
    run jsonnet_run_main "m.value.arrayOfStrings(null)"
    assert_failure
    assert_regex "${output}" \
        "RUNTIME ERROR: Only array type is valid, got \(null\)"

    run jsonnet_run_main "m.value.arrayOfStrings([null], message='this will fail')"
    assert_failure
    assert_regex "${output}" \
        "RUNTIME ERROR: this will fail -> Only array of string is allowed, got null"
}

# bats test_tags=value:arrayOfString
@test "arrayOfStrings valid" {
    run jsonnet_run_main \
        "std.join(',', m.value.arrayOfStrings(['other', 'more'], message='this will not fail'))"
    assert_success
    assert_regex "${output}" "other,more"

    run jsonnet_run_main \
        "m.value.arrayOfStrings([])"
    assert_success
    assert_regex "${output}" "\[ *\]"
}
