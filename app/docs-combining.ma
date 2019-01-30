[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Combining,
  ],
  [
    gap: 20,
    "
    In Maraca, two expressions written next to each other are 'combined'. Multiple expressions next to each other are combined pairwise, from left to right, so the following are equivalent.
    ",
    code?.["a b c d", "(((a b) c) d)"],
  ],
  [
    gap: 20,
    [
      style: 26 bold,
      color: colors?.red,
      Cases,
    ],
    "
    For every pair, the operation applied depends on the types being combined (out of nil, value, and list).
    ",
    [
      style: 18 bold,
      "nil/value - nil/value",
    ],
    "
    Combining nil and value expressions joins the string values together, treating nil as the empty string. If neither value is nil and there are any spaces between the expressions, a single space is added between the strings.
    ",
    code?.["Hello   world", "'£{10 + 20}", """"" XYZ {5 / 2}"],
    [
      style: 18 bold,
      "nil/value - list",
    ],
    "
    Combining nil or a value with a list performs a key lookup on the list. The expressions can be either way round.
    ",
    code?.["(1 + 1) [a, b, c]", "[x: a, y: b] x", "(1 == 2) [: 10, true: 20]"],
  ],
  [
    gap: 20,
    [
      style: 26 bold,
      color: colors?.red,
      "The dot operator",
    ],
    "
    The dot operator also performs combination, but at a lower precedence than direct combinations. This is useful for avoiding lots of parentheses, for example the following are equivalent.
    ",
    code?.["(User?)(Profile)(Last name)", "User?.Profile.Last name"],
    "
    Also, the dot operator behaves differently for nil/value combinations, treating nil as an empty list. This allows for nested key lookups on potentially nil values.
    ",
    code?
      .[
        "[x: 1] y z",
        "[x: 1].y.z",
      ],
    "When used between values, no space is added.",
    code?.["Hello.world"],
  ],
]