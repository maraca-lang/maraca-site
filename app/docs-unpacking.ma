[
  gap: 40,
  [style: 40 bold, color: colors?.red, Unpacking],
  [
    gap: 25,,

    "The unpack operator assigns all the values of a list onto the current one.",
    code?.["[x: 1, ~: [y: 2, z: 3]]"],,

    "Previous values on the same keys are overwritten, except for indexed values
    which are shifted so that they follow any existing ones.",
    code?.["[x: a, ~: [x: b, y: c]]", "[1, 2, ~: [3, 4]]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Destructuring],
    "Another list can be used to transform the keys during unpacking. The values
    of this list are paired (by matching keys) with those of the unpacked list,
    and used as the new keys.",
    code?.["[x: a, [y, z]: [b, c]]", "[x: 1, [a: y]: [a: 2]]"],,

    "An underscore (i.e. space) can be used as a placeholder, as long as it
    doesn't matter that a value will be assigned to the 'space' key.",
    code?.["[[_, _, a]: [1, 2, 3]]"],,

    [style: 18 bold, Partial unpacking],
    "Only values with a new key are unpacked, unless the destructuring list has
    a default, in which case all unpaired values are unpacked onto a new list on
    that key.",
    code?.["[[x, y]: [1, 2, 3]]", "[[a, =\> b]: [1, 2, 3]]"],,

    "The assignment shorthand syntax is useful if you want to unpack a subset of
    values from a list, without transforming keys.",
    code?.["[[a:=, b:=]: [a: 1, b: 2, c: 3, d: 4]]"],,

    [style: 18 bold, Nested lists],
    "Destructuring can also be used to recursively unpack nested lists.",
    code?.["[[a, [b, c]]: [1, [2, 3]]]"],
  ],
]
