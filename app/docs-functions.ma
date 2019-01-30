[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Functions,
  ],
  [
    gap: 25,
    "
    Lists can provide a default value to return when a missing key is accessed, and this value can be a function of the key.
    ",
    [
      style: 18 bold,
      Defaults,
    ],
    "The most simple default value is just a constant.",
    code?.["z.[x: a, y: b, => c]"],
    [
      style: 18 bold,
      Functions,
    ],
    "
    Any list default can access the provided key, and return a function of it.
    ",
    code?.["10.[v=> v? + 5]"],
    [
      style: 18 bold,
      Map functions,
    ],
    "
    There is also a special 'map' default, which only works with list arguments, and applies the function individually to every key / value pair of the provided list. There is also a shorthand syntax for when you only need to access the items.
    ",
    code?
      .[
        "[5, 10, 15].[k=> v=> [k?, v?]]",
        "[5, 10, 15].[v=>> v? + 5]",
      ],
    "
    By default, map functions assign the mapped values to the same keys, but you can assign new keys instead.
    ",
    code?.["[a, b, c].[v=>> Item {v?}: v?]"],
    [
      style: 18 bold,
      Argument destructuring,
    ],
    "
    Function arguments are unpacked onto the parameter value provided, allowing for destructuring.
    ",
    code?.["[1, 2].[[x, y]=> x? + y?]"],
  ],
]