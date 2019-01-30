[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Lists,
  ],
  [
    gap: 25,
    "
    There is only one data structure in Maraca, the list. Lists are collections of values grouped by square brackets.
    ",
    [
      style: 18 bold,
      Basic lists,
    ],
    code?.["[a, b, c]", "[10 + 5, Hello world'!]"],
    [
      style: 18 bold,
      Nil values are removed,
    ],
    code?.["[a, 1 == 2, b, , , c]"],
    [
      style: 18 bold,
      Nested lists,
    ],
    code?.["[a, [b, c]]"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Keys and accessing values,
    ],
    "
    All values in a list are associated with a 'key', which can be used to access that value by writing it either side of the list.
    ",
    [
      style: 18 bold,
      Implicit index keys,
    ],
    "A positive integer 'n' accesses the 'n'th value of a list.",
    code?.["2 [a, b, c]", "[a, b, c] 1"],
    "Indexes ignore removed nil values.",
    code?.["3 [a, 1 == 2, b, , , c]"],
    [
      style: 18 bold,
      Explicit keys,
    ],
    "Any value in a list can be given an explicit key.",
    code?.["[x: a, y: b]"],
    "These are accessed in the same way.",
    code?.["y [x: a, y: b]", "[x: a, y: b] x"],
    [
      style: 18 bold,
      Combining implicit and explicit,
    ],
    "Explicit keys are automatically combined with implicit indexes.",
    code?.["[x: a, b, c]"],
    "
    After assigning the value to its key, the set operator : returns nil. This means explicitly keyed values are ignored for integer indexes.
    ",
    code?.["1 [x: a, b, c]"],
    [
      style: 18 bold,
      Accessing missing keys,
    ],
    "Accessing a missing key returns nil.",
    code?.["[x: a, y: b] z"],
    [
      style: 18 bold,
      Unpacking,
    ],
    "The unpack operator assigns all keys of a list onto the parent list.",
    code?.["[x: a, :: [y: b, c]]"],
    "
    By default keys are maintained during unpacking, but another list can be provided to transform them, similar to destructuring in other languages.
    ",
    code?.["[x: a, [y, z]:: [b, c]]"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      "The context list",
    ],
    "
    There is a special list called the context list, accessed with '?', which contains all currently assigned values.
    ",
    [
      style: 18 bold,
      Basic use,
    ],
    "
    The context list can be used to access previous values from the current list.
    ",
    code?.["[x: a, y: x?]"],
    "
    Note that the above syntax is just the standard list access syntax, ie. it is equivalent to the following.
    ",
    code?.["[x: a, y: x[x: a]]"],
    [
      style: 18 bold,
      Only earlier values are available,
    ],
    "
    The context list is built up top-to-bottom, so only earlier values can be accessed.
    ",
    code?.["[x: a, y: z?, z: b]"],
    [
      style: 18 bold,
      Nested context,
    ],
    "
    Inside nested lists, the context list also contains (earlier) values from the containing lists.
    ",
    code?.["[x: a, [y: x?]]", "[x: a, [y: z?], z: b]"],
    "In contrast, containing lists can't access values from nested lists.",
    code?.["[[x: a], y: x?]"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Shorthands,
    ],
    "
    There are two shorthand operators for assigning keys to their own value, either directly or from the context list.
    ",
    code?
      .[
        "
        [
          x: 1,
          [x:=],
          [x:=?],
        ]
        ",
      ],
  ],
]