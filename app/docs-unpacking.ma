[
  gap: 40,
  [style: 40 bold, color: colors?.red, Unpacking],
  [
    gap: 25,,

    'Multiple values can be assigned with a single operation by using a list as
    the assignment key. The values in each list are paired together (by matching
    keys), and each pair performs an individual assignment.',
    'This effectively ‘unpacks’ the values of a list onto the current one, using
    the provided keys.',
    code?.["[[a, b, x: c]: [1, 2, x: 3]]"],,

    'An underscore (i.e. space) can be used as a placeholder, as long as it
    doesn’t matter that a value will be assigned to the ‘space’ key.',
    code?.["[[_, _, a]: [1, 2, 3]]"],,

    [style: 18 bold, Partial unpacking],
    'Only values with a new key are unpacked, unless the destructuring list has
    a default, in which case all unpaired values are unpacked onto a new list on
    that key.',
    code?.["[[x, y]: [1, 2, 3]]", "[[a, => b]: [1, 2, 3]]"],,

    [style: 18 bold, Unpacking without changing keys],
    'To unpack a list without changing keys, the values and keys of the left
    hand list must be the same. To do this for a subset of a list, use the
    assignment shorthand syntax, otherwise use the the identity function, ‘~’
    (see the Functions section).',
    code?
    .[
      "[
        [a:=, b:=]:
          [a: 1, b: 2, c: 3, d: 4]
      ]",
      "[x: 1, ~: [y: 2, z: 3]]",
    ],,

    'Note that when using the identity map, indexed values are shifted so that
    they follow any existing ones.',
    code?.["[1, 2, ~: [3, 4]]"],,

    [style: 18 bold, Nested lists],
    'Unpacking can also be used recursively with nested lists.',
    code?.["[[a, [b, c]]: [1, [2, 3]]]"],
  ],
]