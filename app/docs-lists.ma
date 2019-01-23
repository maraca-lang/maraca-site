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
      "Shorthand lists",
    ],
    "
    There are shorthand lists using different bracket types, which can be used for 'and'/'or' boolean logic (utilising the fact that nil values are removed from lists), and for grouping/precedence.
    ",
    [
      style: 18 bold,
      Or,
    ],
    "
    Accessing the first key of a list is equivalent to an 'or' operation on all its values - it will return non-nil (true) if any of the values are non-nil. (More precisely, it will return the first non-nil value in the list).
    ",
    code?.["1.[1 == 2, 3 < 4, 5 == 5]", "1.[1 == 2, 4 < 2]"],
    "A list with braces is shorthand for this 'or' pattern.",
    code?.["{1 == 2, 3 < 4, 5 == 5}", "{1 == 2, 4 < 2}"],
    [
      style: 18 bold,
      And,
    ],
    "
    Accessing the last key of a list is equivalent to an 'and' operation on all its values - it will return non-nil (true) only if all of the values are non-nil. (More precisely, it will return the last value if all are non-nil, otherwise nil).
    ",
    code?.["3.[1 == 2, 3 < 4, 5 == 5]", "2.[1 == 1, 2 < 4]"],
    "A list with parentheses is shorthand for this 'and' pattern.",
    code?.["(1 == 2, 3 < 4, 5 == 5)", "(1 == 1, 2 < 4)"],
    [
      style: 18 bold,
      "Grouping/precedence",
    ],
    "
    For lists with a single value, both the above shorthands translate into accessing the 1 key, ie. the single value itself. Therefore they are equivalent to writing that value directly.
    ",
    code?.["10 + 20", "(10 + 20)", "{10 + 20}"],
    "This can be used for grouping/precedence.",
    code?.["(2 + 3) * 4"],
  ],
]