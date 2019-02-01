[
  gap: 40,
  [style: 40 bold, color: colors?.red, Lists],
  [
    gap: 25,,

    "There is only one data structure in Maraca, the list. Lists are collections of indexed and keyed values grouped by square brackets.",
    code?.["[hello, world]", "[x: a, y: b]", "[10, 20, key: value]"],,

    [style: 18 bold, Nils are ignored],
    "Each comma-separated item of a list is automatically assigned to the next available integer index, except for nil values which are ignored.",
    code?.["[a, , b, , c]"],,

    [style: 18 bold, Nesting],
    "Both values and keys can also themselves be lists.",
    code?.["[x: 1, y: [b, c]]", "[[a, b]: 100]"],,

    [style: 18 bold, Sort order],
    "Lists are ordered by a dictionary sort of the keys.",
    code?.["[z: a, y: b, 1, 2]"],,

    [style: 18 bold, Assignment shorthand],
    "There is a shorthand syntax for assigning a key to its own value.",
    code?.["[item:=]"],,

    [style: 18 bold, Defaults],
    "Lists can have a default value for when a missing key is accessed.",
    code?.["[x: a, y: b, => c]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Unpacking],
    "The unpack operator assigns all keys of a list onto the parent list, maintaining keys apart from indexes which are appended after any already on the list.",
    code?.["[a, :: [b, x: c]]"],,

    [style: 18 bold, Destructuring],
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