[
  gap: 40,
  [style: 40 bold, color: colors?.red, Context],
  [
    gap: 25,,

    'There is a special list called the context list, accessed with ‘?’, which
    contains all currently assigned values.',,

    [style: 18 bold, Basic use],
    'The context list can be used to access previous values from the current
    list.',
    code?.["[x: a, y: x?]"],,

    'Note that combining the context list with a value is just the standard list
    access syntax, ie. the above is roughly equivalent to the following.',
    code?.["[x: a, y: x[x: a]]"],,

    [style: 18 bold, Only earlier values are available],
    'The context list is built up left-to-right / top-to-bottom, and only
    earlier values can be accessed.',
    code?.["[x: a, y: z?, z: b]"],,

    [style: 18 bold, Nested context],
    'Inside nested lists, the context list also contains (earlier) values from
    the containing lists, except for indexed values which are cleared whenever a
    new list is started.',
    code?.["[x: a, y: [x?]]", "[x: a, y: [z?], z: b]", "[a, [1?]]"],
    'In contrast, containing lists can’t access values from nested lists.',
    code?.["[[x: a], x?]"],,

    [style: 18 bold, Assignment shorthand],
    'There is a shorthand syntax for assigning a key to its own current value
    from the context.',
    code?.["[x: 1, y: [x:=?]]"],
  ],
]