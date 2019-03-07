[
  gap: 40,
  [style: 40 bold, color: colors?.red, Unpacking],
  [
    gap: 25,,

    "The unpack operator assigns all keys of a list onto the parent list, maintaining keys apart from indexes which are appended after any already on the list.",
    code?.["[a, :: [b, x: c]]"],,

    "Another list can be provided to transform the keys, i.e. to perform destructuring.",
    code?.["[[x, y]:: [a, b, c]]", "[[a:=, b: c]:: [a: 1, b: 2]]"],,

    "This can include nested values.",
    code?.["[[a, [b, c]]:: [1, [2, 3]]]"],,

    "If the destructuring list has a default, all unpaired values will be unpacked onto that key.",
    code?.["[[a, => b]:: [1, 2, 3]]"],,

    "An underscore (i.e. space) can be used as a placeholder, as long as it doesn't matter that a value will be assigned to the space key.",
    code?.["[[_, _, a]:: [1, 2, 3]]"],
  ],
]