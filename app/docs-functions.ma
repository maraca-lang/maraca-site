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
      Simple defaults,
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
    There is also a special 'map' default, which only works with list keys/arguments, and applies the function individually to every item of the provided list.
    ",
    code?.["[5, 10, 15].[v=>> v? + 5]"],
  ],
]