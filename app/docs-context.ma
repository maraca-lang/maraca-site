[
  gap: 40,
  [style: 40 bold, color: colors?.red, Context],
  [
    gap: 25,,

    'There is a special list called the context list, accessed with ‘?’, which
    contains all previously assigned values, and can be used to treat list
    assignments like named variables. Existing context is maintained when new
    lists are created.',,

    code?.["[x: a, y: x?]", "[x: a, y: [x?]]"],,

    'Note that combining the context list with a value is just the standard list
    access syntax, ie. the first example above is equivalent to the following.',
    code?.["[x: a, y: x[x: a]]"],,

    [style: 18 bold, 'Only ‘earlier’ values are available'],
    'Within a Maraca script, the context list is built up top-to-bottom,
    left-to-right, and out-to-in, and only ‘earlier’ values can be accessed.
    Also, indexed values are cleared whenever a new list is started.',
    code?
    .[
      "[x: a, y: z?, z: b]",
      "[x: a, y: [z?], z: b]",
      "[[x: a], x?]",
      "[a, [1?]]",
    ],
  ],
]