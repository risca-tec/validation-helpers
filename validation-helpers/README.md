# validation-helpers

`validation-helpers` is a package for easy the input validation and sanitation.

## Install

```
jb install https://github.com/risca-tec/validation-helpers@master
```

## Usage

```jsonnet
local validation-helpers = import "https://github.com/risca-tec/validation-helpers"
```


## Index

* [`obj utilities`](#obj-utilities)
  * [`fn typeValidation(o, types, message)`](#fn-utilitiestypevalidation)
* [`obj value`](#obj-value)
  * [`fn array(array, message)`](#fn-valuearray)
  * [`fn arrayOfStrings(o, message)`](#fn-valuearrayofstrings)
  * [`fn bool(o, message)`](#fn-valuebool)
  * [`fn literal(str, allowed, message)`](#fn-valueliteral)
  * [`fn nil(o, message)`](#fn-valuenil)
  * [`fn nilOrArray(o, message)`](#fn-valuenilorarray)
  * [`fn nilOrNumber(o, message)`](#fn-valuenilornumber)
  * [`fn nilOrObject(o, message)`](#fn-valuenilorobject)
  * [`fn nilOrString(o, message)`](#fn-valuenilorstring)
  * [`fn number(num, message)`](#fn-valuenumber)
  * [`fn object(o, message)`](#fn-valueobject)
  * [`fn string(str, message)`](#fn-valuestring)

## Fields

### obj utilities

Collection of utilities.

#### fn utilities.typeValidation

```jsonnet
utilities.typeValidation(o, types, message)
```

PARAMETERS:

* **o** (`any`)
* **types** (`array`)
* **message** (`string`)

Return value if object type match with provided types, otherwise raise error.
### obj value

Values enforcement

#### fn value.array

```jsonnet
value.array(array, message)
```

PARAMETERS:

* **array** (`any`)
* **message** (`string`)

Enforce array, raise error if not array
#### fn value.arrayOfStrings

```jsonnet
value.arrayOfStrings(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce array of string only, raise error for any other type
#### fn value.bool

```jsonnet
value.bool(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce boolean otherwise raise error.
#### fn value.literal

```jsonnet
value.literal(str, allowed, message)
```

PARAMETERS:

* **str** (`any`)
* **allowed** (`array`)
* **message** (`string`)

Enforce literal value, raise error if string not in literal
#### fn value.nil

```jsonnet
value.nil(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce null value, raise error for any other type
#### fn value.nilOrArray

```jsonnet
value.nilOrArray(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Return value if array type or null type, otherwise raise error.
#### fn value.nilOrNumber

```jsonnet
value.nilOrNumber(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Return value if number type or null type, otherwise raise error.
#### fn value.nilOrObject

```jsonnet
value.nilOrObject(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Return value if object type or null type, otherwise raise error.
#### fn value.nilOrString

```jsonnet
value.nilOrString(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce string type or null type, raise error if not string.
#### fn value.number

```jsonnet
value.number(num, message)
```

PARAMETERS:

* **num** (`any`)
* **message** (`string`)

Enforce type number (no normalization) otherwise raise error.
#### fn value.object

```jsonnet
value.object(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce object type, raise error if not object
#### fn value.string

```jsonnet
value.string(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Enforce string type, raise error if not string
