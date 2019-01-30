[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Overview,
  ],
  [
    gap: 25,
    "
    Maraca is a lightweight, embedded language. This documentation describes the core syntax and features of the language.
    ",
    [
      style: 18 bold,
      Setup,
    ],
    "
    Currently, only js / web is supported. Click 'Web' above to get your environment set up, or 'Try' to use the online REPL.
    ",
    [
      style: 18 bold,
      Values,
    ],
    "
    All values in Maraca are treated as text/strings, and lazily converted to other types when required.
    ",
    code?
      .[
        Hello,
        "1 + 2",
      ],
    [
      style: 18 bold,
      Lists,
    ],
    "
    Inspired by Lua, Maraca has only one data structure - the list - which combines together keys & indices.
    ",
    code?
      .[
        "
        [
          x: 1,
          y: 2,
          hello,
          world,
        ]
        ",
      ],
    [
      style: 18 bold,
      Combining,
    ],
    "
    At the core of Maraca is a special operator - combine - which is applied whenever two expressions are directly next to each other:
    ",
    [
      gap: 10,
      ::
        [
            "value / value: concatenate text",
            "value / list: list lookup",
          ][
            v=>> [style: bullet, v?],
          ],
    ],
    code?
      .[
        "Hello world",
        "y [x: a, y: b]",
      ],
    [
      style: 18 bold,
      Context,
    ],
    "
    The context list '?' accesses previously defined values, allowing for imperative-style code.
    ",
    code?
      .[
        "
        [
          x: 2,
          y: 3,
          z: x? * y?,
        ]
        ",
      ],
    [
      style: 18 bold,
      Functions,
    ],
    "
    Lists can provide a default value to return when a missing key is accessed, and this value can be a function of the key.
    ",
    code?.["[v=> v? + 5] 10"],
    [
      style: 18 bold,
      Logic,
    ],
    "
    Lists ignore entries which are nil (equivalent to false), which allows for shorthand syntaxes for boolean logic - braces for OR, parentheses for AND.
    ",
    code?
      .[
        "{1 == 2, 3 < 4}",
        "(1 == 2, 3 < 4)",
      ],
  ],
]