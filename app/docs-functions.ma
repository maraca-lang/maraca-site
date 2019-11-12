[
  gap: 40,
  [style: 40 bold, color: colors?.red, Functions],
  [
    gap: 25,,

    'One way to look at a list is as a map from keys to values. In this light,
    it is a acting as a simple function, defined on specific input values.
    Maraca allows for extending lists to act as full functions, by defining what
    to do with input values that don’t match a key.',
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Basic functions],
    'In the simplest case, a default value can be provided for when any missing
    key is accessed.',
    code?.["z.[x: a, y: b, => c]"],
    'To create a proper function, this form can be extended to use the provided
    input.',
    code?.["10.[v=> v? + 5]"],
    'The input is assigned onto the parameter value provided, so if both are
    lists then this will perform a multi assignment. This effectively allows for
    functions with multiple inputs.',
    code?.["[1, 2].[[x, y]=> x? + y?]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Map functions],
    'There is also a ‘map’ form, which only accepts lists as input (any non-list
    input will just return nil), and applies the function individually to every
    value / key pair, creating a new list from all the results. The map is
    applied to each element in the order they are sorted in the list.',
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