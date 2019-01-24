[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Logic,
  ],
  [
    gap: 25,
    "
    Logical operations in Maraca return either the string 'true' (for true), or nil (for false).
    ",
    [
      style: 18 bold,
      Equal,
    ],
    code?.["2 == 6"],
    [
      style: 18 bold,
      Comparisons,
    ],
    code?.["5 < 3", "5 <= 5", "8 > 2", "1 >= 3"],
    [
      style: 18 bold,
      Not,
    ],
    code?.["8 ! 2", "! 3 < 5"],
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
      "Aside: grouping / precedence",
    ],
    "
    For lists with a single value, both the above shorthands translate into accessing the 1 key, ie. the single value itself. Therefore they are equivalent to writing that value directly.
    ",
    code?.["10 + 20", "(10 + 20)", "{10 + 20}"],
    "This can be used for grouping / precedence.",
    code?.["(2 + 3) * 4"],
  ],
]