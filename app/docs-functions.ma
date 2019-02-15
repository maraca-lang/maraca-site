[
  gap: 40,
  [style: 40 bold, color: colors?.red, Functions],
  [
    gap: 25,,

    "List defaults can be functions of the provided key.",
    code?.["10.[v=> v? + 5]"],,

    [style: 18 bold, Argument destructuring],
    "Function arguments are unpacked onto the parameter value provided, allowing for destructuring.",
    code?.["[1, 2].[[x, y]=> x? + y?]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Maps],
    "There is also a 'map' form, which only works with list arguments, and applies the function individually to every key / value pair of the provided list. There is a shorthand syntax for when you only need to access the items.",
    "The map is applied to each element in the order they are sorted in the list.",
    code?.["[5, 10].[k=> v=> [k?, v?]]", "[5, 10].[v=>> v? + 5]"],,

    [style: 18 bold, Changing keys],
    "By default, map functions assign the mapped values to the same keys, but you can assign new keys instead.",
    code?.["[a, b, c].[v=>> Item {v?}: v?]"],,

    [style: 18 bold, Initial items],
    "Any items in the map list are used to initialise the new list. This can be useful for list 'reductions', where a map is used to generate a single value, such as a sum.",
    code?.["[1, 2, 3].[sum: 0, v=>> sum: sum? + v?].sum"],
  ],
]