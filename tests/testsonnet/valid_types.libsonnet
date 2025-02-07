local test = import 'github.com/yugui/jsonnetunit/jsonnetunit/test.libsonnet';
local validator = import 'validation-helpers/main.libsonnet';

test.suite({
  testFact: {
    local valid(string) = validator.value.literal(string, ['valid', 'also'], 'Only some allowed'),

    actual: valid('invalid'),
    expect: 'valid',
  },
})
