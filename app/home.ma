[
  #title(Maraca),
  style: Montserrat 18,
  color: 0 0 20,
  width: 900,
  pad: 50 10,
  gap: 50,
  [
    gap: 20,
    [image: "./maraca.png", width: 60],
    [
      style: 50 bold center,
      color: colors?.red,
      Maraca,
    ],
    [
      style: bold center,
      color: colors?.green,
      "
      The intuitive & powerful data language, from simple formulae to advanced interfaces.
      ",
    ],
  ],
  [
    gap: 30,
    [
      style: 30 bold,
      color: colors?.red,
      Basic syntax,
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Values,
      ],
      code?
        .[
          "Words made of letters and numbers",
          "
          Hello
          a1
          X Y Z
          option 5
          First name
          ",
        ],
      code?
        .[
          "Decimal numbers",
          12.34,
        ],
      code?
        .[
          "Negative values",
          "
          -1
          -Hello
          ",
        ],
      code?
        .[
          "Extra spaces are removed",
          "Hello   123",
          "Hello 123",
        ],
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Quote values,
      ],
      code?
        .[
          "Characters other than letters or numbers",
          "
          ""£5""
          ""Let's go!""
          ",
        ],
      code?
        .[
          "Extra spaces",
          """Hello   123""",
        ],
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Data values,
      ],
      code?
        .[
          Dates,
          "
          @now
          @tomorrow
          @""10/05/80""
          ",
        ],
      code?
        .[
          Locations,
          "
          @@here
          @@london
          ",
        ],
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Arithmetic,
      ],
      code?
        .[
          "Addition, subtraction, multiplication, division",
          "
          1 + 2
          5 - 1
          3 * 4
          6 / 3
          ",
          "
          3
          4
          12
          2
          ",
        ],
      code?
        .[
          Powers,
          "2 ^ 3",
          8,
        ],
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        "True / False",
      ],
      code?
        .[
          Equal,
          "2 = 6",
          false,
        ],
      code?
        .[
          "Less than (or equal), greater than (or equal)",
          "
          5 < 3
          5 <= 5
          8 > 2
          1 >= 3
          ",
          "
          false
          true
          true
          false
          ",
        ],
      code?
        .[
          Not,
          "
          8 ! 2
          ! 3 < 5
          ",
          "
          true
          false
          ",
        ],
      code?
        .[
          "And: all items true",
          "(1 = 2, 3 < 4, 5 = 5)",
          false,
        ],
      code?
        .[
          "Or: any item true",
          "{1 = 2, 3 < 4, 5 = 5}",
          true,
        ],
    ],
  ],
  [
    gap: 30,
    [
      style: 30 bold,
      color: colors?.red,
      Working with data,
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Accessing,
      ],
      [
        "
        If you are using Maraca somewhere that data is available, you can access it using '?'.
        ",
        pad: 10 0,
      ],
      code?
        .[
          "In some places, '?' is a single value",
          '?,
          "
          10
          Hello
          ...
          ",
        ],
      code?
        .[
          "Otherwise, you choose a field / column",
          "First name?",
          "
          William
          Charlotte
          ...
          ",
        ],
    ],
    [
      gap: 15,
      [
        style: 24 bold,
        color: colors?.red,
        Ordering,
      ],
      code?
        .[
          "Order in reverse",
          "-Last name?",
          "
          ...
          Williams
          Smith
          ...
          ",
        ],
    ],
  ],
]