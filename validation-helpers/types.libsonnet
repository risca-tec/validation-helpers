local d = import 'doc-util/main.libsonnet';

local typeValidation(o, types, message=null) = {
  types: types,
  message: if message == null then 'Invalid value' else message,
  o: o,
  assert std.member($.types, std.type(o)) : '%s -> only %s value are accepted (found instead %s)' %
                                            [$.message, std.join(', ', $.types), std.type($.o)],
}.o;


{
  '#type':: d.obj('Functions for enforcing values type.'),
  type: {
    '#nullOrObject':: d.fn('Return value if object type or null type, otherwise raise error.', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nullOrObject: function(o, message=null) typeValidation(o, ['null', 'object'], message=message),

    '#nullOrArray':: d.fn('Return value if array type or null type, otherwise raise error.', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nullOrArray: function(o, message=null) typeValidation(o, ['null', 'array'], message=message),

    '#nullOrString':: d.fn('Enforce string type or null type, raise error if not string.', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nullOrString: function(o, message=null) typeValidation(o, ['null', 'string'], message=message),

    '#nullOrNumber':: d.fn('Return value if number type or null type, otherwise raise error.', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    nullOrNumber: function(o, message=null) typeValidation(o, ['null', 'number'], message=message),

    '#string':: d.fn('Enforce string type, raise error if not string', [
      d.arg('str', d.T.any),
      d.arg('message', d.T.string, default=null),
    ]),
    string(str, message=null): if std.isString(str) then
      str else
      if std.isString(message) then
        error '%s -> Only object values are valid, got (%s)' % [message, std.type(str)]
      else
        error '%s -> Only object values are valid, got (%s)' % std.type(str),

    '#bool':: d.fn(
      'Return the value if boolean otherwise raise error.',
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
      'Return the value if number (no normalization) otherwise raise error.',
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

    '#array': d.fn(
      'Return object if array, otherwise raise error.',
      [d.arg('num', d.T.any), d.arg('message', d.T.string, default=null)]
    ),
    array(o, message=null): if std.isArray(o) then
      o else
      if std.isString(message) then
        error '%s -> Only array values are valid, got (%s)' % [message, std.type(o)]
      else
        error '%s -> Only array values are valid, got (%s)' % std.type(o),

    typeValidation: typeValidation,
  },
  '#value':: d.obj('Extra values enforcement'),
  value: {
    '#literal':: d.fn('Enforce literal value, raise error if string not in literal', [
      d.arg('str', d.T.any),
      d.arg('allowed', d.T.array),
      d.arg('message', d.T.string, default=null),
    ]),
    literal(str, allowed, message=null): if std.member(allowed, str) then str else
      if std.isString(message) then
        error '%s -> Only allowed values are: %s' % [message, allowed]
      else
        error 'Only allowed values are: %s' % allowed,
  },
}
