// Validation utilities
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

local types = import 'validation-helpers/types.libsonnet';

{
  '#': d.pkg(
    name='validation-helpers',
    url='https://github.com/risca-tec/validation-helpers',
    help=|||
      `validation-helpers` is a package for easy the input validation and sanitation.
    |||
  ),
} +
types
