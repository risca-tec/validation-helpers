local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';


{
  '#utilities':: d.obj('Collection of utilities.'),
  utilities: {
    '#typeValidation':: d.fn('Return value if object type match with provided types, otherwise raise error.', [
      d.arg('o', d.T.any),
      d.arg('types', d.T.array),
      d.arg('message', d.T.string, default=null),
    ]),
    typeValidation(o, types, message=null): {
      types: types,
      message: if message == null then 'Invalid value' else message,
      o: o,
      assert std.member($.types, std.type(o)) : '%s -> only %s value are accepted (found instead %s)' %
                                                [$.message, std.join(', ', $.types), std.type($.o)],
    }.o,

  },
  '#value':: d.obj('Values enforcement'),
  value: {
    local v = self,
    '#string':: d.fn('Enforce string type, raise error if not string', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    string(str, message=null): if std.isString(str) then
      str else
      if std.isString(message) then
        error '%s -> Only string values are valid, got (%s)' % [message, std.type(str)]
      else
        error 'Only string values are valid, got (%s)' % std.type(str),

    '#array':: d.fn('Enforce array, raise error if not array', [
      d.arg('array', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    array(array, message=null): if std.isArray(array) then
      array else
      if std.isString(message) then
        error '%s -> Only array type is valid, got (%s)' % [message, std.type(array)]
      else
        error 'Only array type is valid, got (%s)' % std.type(array),

    '#bool':: d.fn(
      'Enforce boolean otherwise raise error.',
      [d.arg('o', d.T.any), d.arg('message', d.T.string, default=null)]
    ),
    bool(o, message=null): if std.isBoolean(o) then
      o
    else
      if std.isString(message) then
        error '%s -> Only boolean values are accepted, got (%s)' % [message, std.type(o)]
      else
        error 'Only boolean values are accepted, got (%s)' % std.type(o),

    '#number': d.fn(
      'Enforce type number (no normalization) otherwise raise error.',
      [d.arg('num', d.T.any), d.arg('message', d.T.string, default=null)]
    ),
    number(num, message=null): if std.isNumber(num) then
      num else
      if std.isString(message) then
        error '%s -> Only number values are valid, got (%s)' % [message, std.type(num)]
      else
        error '%s -> Only number values are valid, got (%s)' % std.type(num),

    '#object':: d.fn('Enforce object type, raise error if not object', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    object(o, message=null): if std.isObject(o) then
      o else
      if std.isString(message) then
        error '%s -> Only object values are valid, got (%s)' % [message, std.type(o)]
      else
        error '%s -> Only object values are valid, got (%s)' % std.type(o),

    '#nil':: d.fn('Enforce null value, raise error for any other type', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nil(o, message=null): if o == null then o else
      if std.isString(message) then
        error '%s -> Got type %s' % [message, std.type(o)]
      else
        error 'Only null value is allowed, got %s' % std.type(o),

    '#literal':: d.fn('Enforce literal value, raise error if string not in literal', [
      d.arg('str', d.T.any),
      d.arg('allowed', d.T.array),
      d.arg('message', d.T.string, default=null),
    ]),
    literal(str, allowed, message=null): if std.member(allowed, str) then str else
      if std.isString(message) then
        error '%s -> Only allowed values are: %s' % [message, std.join(', ', allowed)]
      else
        error 'Only allowed values are: %s' % std.join(', ', allowed),

    '#arrayOfStrings':: d.fn('Enforce array of string only, raise error for any other type', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    arrayOfStrings(o, message=null): if std.all(std.map(std.isString, v.array(o, message=message))) then
      o else
      if std.isString(message) then
        error '%s -> Only array of string is allowed, got %s' % [message, std.join(', ', [std.type(x) for x in o])]
      else
        error 'Only array of string is allowed, got %s' % [std.join(', ', [std.type(x) for x in o])],

    '#nilOrObject':: d.fn('Return value if object type or null type, otherwise raise error.', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nilOrObject(o, message=null): if o == null then
      o
    else if std.isObject(o) then
      o
    else
      if std.isString(message) then
        error '%s -> Got type %s' % [message, std.type(o)]
      else
        error 'Only null or object types are allowed, got %s' % std.type(o),

    '#nilOrArray':: d.fn('Return value if array type or null type, otherwise raise error.', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nilOrArray(o, message=null): if o == null then
      o
    else if std.isArray(o) then
      o
    else
      if std.isString(message) then
        error '%s -> Got type %s' % [message, std.type(o)]
      else
        error 'Only null or array types are allowed, got %s' % std.type(o),

    '#nilOrString':: d.fn('Enforce string type or null type, raise error if not string.', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nilOrString(o, message=null): if o == null then
      o
    else if std.isString(o) then
      o
    else
      if std.isString(message) then
        error '%s -> Got type %s' % [message, std.type(o)]
      else
        error 'Only null or array types are allowed, got %s' % std.type(o),

    '#nilOrNumber':: d.fn('Return value if number type or null type, otherwise raise error.', [
      d.arg('o', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nilOrNumber(o, message=null): if o == null then
      o
    else if std.isNumber(o) then
      o
    else
      if std.isString(message) then
        error '%s -> Got type %s' % [message, std.type(o)]
      else
        error 'Only null or array types are allowed, got %s' % std.type(o),
  },
}
