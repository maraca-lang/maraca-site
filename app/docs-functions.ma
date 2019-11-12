[
  gap: 40,
  [style: 40 bold, color: colors?.red, Functions],
  [
    gap: 25,,

    'Lists can have a default value for when a missing key is accessed.',
    code?.["z.[x: a, y: b, => c]"],,

    'These defaults can be functions of the provided key.',
    code?.["10.[v=> v? + 5]"],,

    [style: 18 bold, Argument unpacking],
    'The function argument is assigned to the parameter value provided, so if
    both are lists then the argument will be unpacked. This effectively allows
    for multi argument functions.',
    code?.["[1, 2].[[x, y]=> x? + y?]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Maps],
    'There is also a ‘map’ form, which only accepts lists (any non-list argument
    will just return nil), and applies the function individually to every value
    / key pair, creating a new list from all the results. The map is applied to
    each element in the order they are sorted in the list.',
    'There is a shorthand syntax for when you only need to access the values.',
    code?
    .["[5, 10].[v=> k=> [v?, k?]]", "[5, 10].[v=>> v? + 5]", "x.[v=>> v? + 5]"],
    ,

    [style: 18 bold, Changing keys],
    'By default, map functions assign the mapped values to the same keys, but
    you can assign new keys instead.',
    code?.["[a, b, c].[v=>> Item {v?}: v?]"],,

    [style: 18 bold, Initial items],
    'Any items in the map list are used to initialise the new list. This can be
    useful for list ‘reductions’, where a map is used to generate a single
    value, such as a sum.',
    code?.["[1, 2, 3].[sum: 0, v=>> sum: sum? + v?].sum"],
  ],
]