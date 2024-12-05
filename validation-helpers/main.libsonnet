// Validation utilities
local d = import 'doc-util/main.libsonnet';

local types = import 'validation-helpers/types.libsonnet';

{
  '#': d.pkg(
    name='validation-helpers',
    url='validation-helpers',
    help=|||
      `validation-helpers` is a package for easy the input validation and sanitation.
    |||
  ),
} +
types
