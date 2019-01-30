[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Operators,
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Arithmetic,
    ],
    "
    For arithmetic operations, Maraca converts values into their numeric value, before appling the operator and converting the result back to a string.
    ",
    [
      style: 18 bold,
      "Basic arithmetic",
    ],
    code?.["1 + 2", "5 - 1", "3 * 4", "5 / 2"],
    [
      style: 18 bold,
      Powers,
    ],
    code?.["2 ^ 3"],
    [
      style: 18 bold,
      "Modulo (remainder after division)",
    ],
    code?.["8 % 3"],
    [
      style: 18 bold,
      "Non-numeric values return nil",
    ],
    "If either value can't be converted to a number, nil is returned.",
    code?.["hello + world"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Comparisons,
    ],
    "
    Boolean operations in Maraca return either the string 'true' (for true), or nil (for false).
    ",
    [
      style: 18 bold,
      Loose equal,
    ],
    "Lower values mean more similar.",
    code?
      .[
        "John = James",
        "John = Jon",
      ],
    [
      style: 18 bold,
      Strict equal,
    ],
    code?
      .[
        "2 == 6",
        "3 == 3",
      ],
    [
      style: 18 bold,
      Comparisons,
    ],
    code?.["5 < 3", "5 <= 5", "8 > 2", "1 >= 3"],
    [
      style: 18 bold,
      Not,
    ],
    code?.["8 ! 2", "! 3 < 5"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Custom,
    ],
    "
    The # and @ symbols are custom operators which can be defined as part of your Maraca environment.
    ",
    [
      style: 18 bold,
      Library values,
    ],
    "
    The # symbol is used for your custom library, such as live values (e.g. #url) or methods (e.g. #size).
    ",
    code?.["#url"],
    [
      style: 18 bold,
      Interpreted values,
    ],
    "
    The @ symbol (also @@, @@@) is used for your custom interpreted values (e.g. times and locations).
    ",
    code?.["@tomorrow morning"],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Triggers,
    ],
    "
    These operators related to treating the stream of outputs from an expression as events for triggering other effects.
    ",
    [
      style: 18 bold,
      Trigger,
    ],
    "
    The trigger operator outputs a snapshot of the value on the right everytime the value on the left changes.
    ",
    code?.["@@@1000 & 2"],
    [
      style: 18 bold,
      Copy,
    ],
    "
    The copy operator emits all outputs from the value on the right into the value on the left, and returns nil.
    ",
    code?
      .[
        "
        [
          x: hello,
          x?; @@@1000,
        ]
        ",
      ],
    [
      style: 18 bold,
      Triggering updates,
    ],
    "
    Together, the trigger and copy operators allow for updating values in response to changes to other values.
    ",
    code?
      .[
        "
        [
          x: 0,
          x?; @@@1000 & x? + 10,
        ]
        ",
      ],
  ],
]