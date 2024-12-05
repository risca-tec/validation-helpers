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

* [`obj type`](#obj-type)
  * [`fn array(num, message)`](#fn-typearray)
  * [`fn bool(o, message)`](#fn-typebool)
  * [`fn nullOrArray(str, message)`](#fn-typenullorarray)
  * [`fn nullOrNumber(str, message)`](#fn-typenullornumber)
  * [`fn nullOrObject(str, message)`](#fn-typenullorobject)
  * [`fn nullOrString(str, message)`](#fn-typenullorstring)
  * [`fn number(num, message)`](#fn-typenumber)
  * [`fn object(o, message)`](#fn-typeobject)
  * [`fn string(str, message)`](#fn-typestring)
* [`obj value`](#obj-value)
  * [`fn literal(str, allowed, message)`](#fn-valueliteral)

## Fields

### obj type

Functions for enforcing values type.

#### fn type.array

```jsonnet
type.array(num, message)
```

PARAMETERS:

* **num** (`any`)
* **message** (`string`)

Return object if array, otherwise raise error.
#### fn type.bool

```jsonnet
type.bool(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Return the value if boolean otherwise raise error.
#### fn type.nullOrArray

```jsonnet
type.nullOrArray(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Return value if array type or null type, otherwise raise error.
#### fn type.nullOrNumber

```jsonnet
type.nullOrNumber(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Return value if number type or null type, otherwise raise error.
#### fn type.nullOrObject

```jsonnet
type.nullOrObject(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Return value if object type or null type, otherwise raise error.
#### fn type.nullOrString

```jsonnet
type.nullOrString(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Enforce string type or null type, raise error if not string.
#### fn type.number

```jsonnet
type.number(num, message)
```

PARAMETERS:

* **num** (`any`)
* **message** (`string`)

Return the value if number (no normalization) otherwise raise error.
#### fn type.object

```jsonnet
type.object(o, message)
```

PARAMETERS:

* **o** (`any`)
* **message** (`string`)

Enforce object type, raise error if not object
#### fn type.string

```jsonnet
type.string(str, message)
```

PARAMETERS:

* **str** (`any`)
* **message** (`string`)

Enforce string type, raise error if not string
### obj value

Extra values enforcement

#### fn value.literal

```jsonnet
value.literal(str, allowed, message)
```

PARAMETERS:

* **str** (`any`)
* **allowed** (`array`)
* **message** (`string`)

Enforce literal value, raise error if string not in literal
