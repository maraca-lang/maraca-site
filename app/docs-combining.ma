[
  gap: 40,
  [style: 40 bold, color: colors?.red, Combining],
  [
    gap: 25,,

    "In Maraca, adjacent expressions are 'combined'. There are different cases depending on the types being combined (out of nil, value, and list).",
    "Multiple adjacent expressions next are combined pairwise, from left to right, so the following are equivalent.",
    code?.["a b c d", "(((a b) c) d)"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Concatenating values],
    "Combining two nil/value expressions concatenates them together, treating nil as the empty string.",
    "If neither value is nil and there are any spaces between the expressions, a single space is added between the them.",
    code?.["Hello   world", "'£(30)", """"" WX YZ"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, List key lookup],
    "Combining a nil/value expression with list performs a list key lookup. The order of the expressions, and any spaces between them, have no effect.",
    code?.["y [x: a, y: b]", "[x: a, y: b]x"],
    "A positive integer 'n' accesses the 'n'th value of a list.",
    code?.["2 [a, b, c]", "[a, b, c] 1"],
    "Accessing a missing key returns nil, or the default if provided.",
    code?.["[x: a, y: b] z", "[x: a, y: b, => c] z"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, "The dot operator"],
    "The dot operator also performs combination, but at a lower precedence than direct combinations. This is useful for avoiding lots of parentheses, for example the following are equivalent.",
    code?.["([a b: c])(a b)", "[a b: c].a b"],,

    "When used between values, no space is added.",
    code?.["Hello.world"],,

    [style: 18 bold, "Nil & value returns nil"],
    "There is one case where the dot operator performs a different operation to a standard combination.",
    "If nil and a value are combined, rather than concatenating them, the dot operator treats the nil as an empty list and hence returns nil. This allows for nested key lookups on potentially nil values.",
    code?.["[x: 1] y z", "[x: 1].y.z"],
  ],
]