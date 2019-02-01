[
  gap: 40,
  [style: 40 bold, color: colors?.red, Context],
  [
    gap: 25,,

    "There is a special list called the context list, accessed with '?', which contains all currently assigned values.",,

    [style: 18 bold, Basic use],
    "The context list can be used to access previous values from the current list.",
    code?.["[x: a, y: x?]"],,

    "Note that the above syntax is just the standard list access syntax, ie. it is equivalent to the following.",
    code?.["[x: a, y: x[x: a]]"],,

    [style: 18 bold, Only earlier values are available],
    "The context list is built up top-to-bottom, so only earlier values can be accessed.",
    code?.["[x: a, y: z?, z: b]"],,

    [style: 18 bold, Nested context],
    "Inside nested lists, the context list also contains (earlier) values from the containing lists.",
    code?.["[x: a, [y: x?]]", "[x: a, [y: z?], z: b]"],
    "In contrast, containing lists can't access values from nested lists.",
    code?.["[[x: a], y: x?]"],,

    [style: 18 bold, Assignment shorthand],
    "There is a shorthand syntax for assigning a key to its own current value from the context.",
    code?.["[x: 1, [x:=?]]"],
  ],
]