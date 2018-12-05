{
  code:
    [
      [input, output]=>
        [
          style: Source Code Pro bold exact,
          fill: 0 0 98,
          round: 5,
          pad: 10,
          [
            : row,
            gap: 20,
            [
              width: 0.5,
              color: colors?.green,
              input?,
            ],
            (
              output?,
              [
                width: 0.5,
                style: right,
                color: 0 0 80,
                output?,
              ],
            ),
          ],
        ],
    ],
  #title("Docs | Maraca"),
  [
    style: Montserrat 16,
    color: 0 0 20,
    width: 700,
    pad: 50 10,
    gap: 50,
    [
      gap: 30,
      [
        style: 50 bold,
        color: colors?.red,
        Maraca,
      ],
      [
        style: 40 bold,
        color: colors?.red,
        Values,
      ],
      [
        gap: 20,
        "
        Maraca is a text based language, where all values are strings of characters. There are various ways to create these values.
        ",
        [
          style: 18 bold,
          Alphanumeric and decimals,
        ],
        "
        Alphanumeric words (only from a-z, A-Z and 0-9) and decimals can be written directly.
        ",
        code?
          .[
            "
            Hello
            20
            a1
            12.34
            ",
            "
            Hello
            20
            a1
            12.34
            ",
          ],
        [
          style: 18 bold,
          Multiple values,
        ],
        "
        Multiple values separated by spaces are joined together, with extra spaces removed.
        ",
        code?
          .[
            "
            X Y Z
            option 5
            First name
            Hello   123
            ",
            "
            X Y Z
            option 5
            First name
            Hello 123
            ",
          ],
        [
          style: 18 bold,
          Escaped characters,
        ],
        "Single non-alphanumeric characters can be escaped with a \\.",
        code?
          .[
            "
            \\@
            \\£5
            ",
            "
            @
            £5
            ",
          ],
        [
          style: 18 bold,
          Quoted values,
        ],
        "
        Longer complex strings can be created with double quotes, allowing non-alphanumeric characters and extra spaces.
        ",
        code?
          .[
            "
            \"Let's go!\"
            \"Hello   123\"
            ",
            "
            Let's go!
            Hello   123
            ",
          ],
        [
          style: 18 bold,
          Nil,
        ],
        "
        The empty value is called 'nil' and has special behaviour in various situations. It can be written as an empty quoted string, although is rarely used directly in this way.
        ",
        code?
          .[
            "\"\"",
          ],
      ],
      [
        gap: 20,
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
        code?
          .[
            "
            1 + 2
            5 - 1
            3 * 4
            5 / 2
            ",
            "
            3
            4
            12
            2.5
            ",
          ],
        [
          style: 18 bold,
          Powers,
        ],
        code?
          .[
            "2 ^ 3",
            8,
          ],
        [
          style: 18 bold,
          "Modulo (remainder after division)",
        ],
        code?
          .[
            "8 % 3",
            2,
          ],
        [
          style: 18 bold,
          "Non-numeric values return nil",
        ],
        "If either value can't be converted to a number, nil is returned.",
        code?
          .[
            "hello + world",
          ],
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          "True / False",
        ],
        "
        Logical operations in Maraca return either the string 'true' (for true), or nil (for false).
        ",
        [
          style: 18 bold,
          Equal,
        ],
        code?
          .[
            "2 == 6",
          ],
        [
          style: 18 bold,
          Comparisons,
        ],
        code?
          .[
            "
            5 < 3
            5 <= 5
            8 > 2
            1 >= 3
            ",
            "

            true
            true

            ",
          ],
        [
          style: 18 bold,
          Not,
        ],
        code?
          .[
            "
            8 ! 2
            ! 3 < 5
            ",
            "
            true

            ",
          ],
      ],
      [
        style: 40 bold,
        color: colors?.red,
        Lists,
      ],
      [
        gap: 20,
        "
        There is only one data structure in Maraca, the list. Lists are collections of values grouped by square brackets.
        ",
        [
          style: 18 bold,
          Basic lists,
        ],
        code?
          .[
            "
            [a, b, c]
            [10 + 5, Hello world\\!]
            ",
            "
            [a, b, c]
            [15, Hello world!]
            ",
          ],
        [
          style: 18 bold,
          Nil values are removed,
        ],
        code?
          .[
            "[a, 1 == 2, b, , , c]",
            "[a, b, c]",
          ],
        [
          style: 18 bold,
          Nested lists,
        ],
        code?
          .[
            "[a, [b, c]]",
            "[a, [b, c]]",
          ],
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          Keys and accessing values,
        ],
        "
        All values in a list are associated with a 'key', which can be used to access that value by writing it either side of the list.
        ",
        [
          style: 18 bold,
          Implicit index keys,
        ],
        "A positive integer 'n' accesses the 'n'th value of a list.",
        code?
          .[
            "
            2 [a, b, c]
            [a, b, c] 1
            ",
            "
            b
            a
            ",
          ],
        "Indexes ignore removed nil values.",
        code?
          .[
            "3 [a, 1 == 2, b, , , c]",
            c,
          ],
        [
          style: 18 bold,
          Explicit keys,
        ],
        "Any value in a list can be given an explicit key.",
        code?
          .[
            "[x: a, y: b]",
            "[x: a, y: b]",
          ],
        "These are accessed in the same way.",
        code?
          .[
            "
            y [x: a, y: b]
            [x: a, y: b] x
            ",
            "
            b
            a
            ",
          ],
        [
          style: 18 bold,
          Combining implicit and explicit,
        ],
        "Explicit keys are automatically combined with implicit indexes.",
        code?
          .[
            "[x: a, b, c]",
            "[x: a, b, c]",
          ],
        "
        After assigning the value to its key, the set operator : returns nil. This means explicitly keyed values are ignored for integer indexes.
        ",
        code?
          .[
            "1 [x: a, b, c]",
            b,
          ],
        [
          style: 18 bold,
          Accessing missing keys,
        ],
        "Accessing a missing key returns nil.",
        code?
          .[
            "[x: a, y: b] z",
          ],
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          "The context list",
        ],
        "
        There is a special list called the context list, accessed with '?', which contains all currently assigned values.
        ",
        [
          style: 18 bold,
          Basic use,
        ],
        "
        The context list can be used to access previous values from the current list.
        ",
        code?
          .[
            "[x: a, y: x?]",
            "[x: a, y: a]",
          ],
        "
        Note that the above syntax is just the standard list access syntax, ie. it is equivalent to the following.
        ",
        code?
          .[
            "[x: a, y: x[x: a]]",
            "[x: a, y: a]",
          ],
        [
          style: 18 bold,
          Only earlier values are available,
        ],
        "
        The context list is built up top-to-bottom, so only earlier values can be accessed.
        ",
        code?
          .[
            "[x: a, y: z?, z: b]",
            "[x: a, y: , z: b]",
          ],
        [
          style: 18 bold,
          Nested context,
        ],
        "
        Inside nested lists, the context list also contains (earlier) values from the containing lists.
        ",
        code?
          .[
            "
            [x: a, [y: x?]]
            [x: a, [y: z?], z: b]
            ",
            "
            [x: a, [y: a]]
            [x: a, [y: ], z: b]
            ",
          ],
        "In contrast, containing lists can't access values from nested lists.",
        code?
          .[
            "[[x: a], y: x?]",
            "[[x: a], y: ]",
          ],
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          "Shorthand lists",
        ],
        "
        There are shorthand lists using different bracket types, which can be used for 'and'/'or' boolean logic (utilising the fact that nil values are removed from lists), and for grouping/precedence.
        ",
        [
          style: 18 bold,
          Or,
        ],
        "
        Accessing the first key of a list is equivalent to an 'or' operation on all its values - it will return non-nil (true) if any of the values are non-nil. (More precisely, it will return the first non-nil value in the list).
        ",
        code?
          .[
            "
            1.[1 == 2, 3 < 4, 5 == 5]
            1.[1 == 2, 4 < 2]
            ",
            true,
          ],
        "A list with braces is shorthand for this 'or' pattern.",
        code?
          .[
            "
            {1 == 2, 3 < 4, 5 == 5}
            {1 == 2, 4 < 2}
            ",
            true,
          ],
        [
          style: 18 bold,
          And,
        ],
        "
        Accessing the last key of a list is equivalent to an 'and' operation on all its values - it will return non-nil (true) only if all of the values are non-nil. (More precisely, it will return the last value if all are non-nil, otherwise nil).
        ",
        code?
          .[
            "
            3.[1 == 2, 3 < 4, 5 == 5]
            2.[1 == 1, 2 < 4]
            ",
            "

            true
            ",
          ],
        "A list with parentheses is shorthand for this 'and' pattern.",
        code?
          .[
            "
            (1 == 2, 3 < 4, 5 == 5)
            (1 == 1, 2 < 4)
            ",
            "

            true
            ",
          ],
        [
          style: 18 bold,
          "Grouping/precedence",
        ],
        "
        For lists with a single value, both the above shorthands translate into accessing the 1 key, ie. the single value itself. Therefore they are equivalent to writing that value directly.
        ",
        code?
          .[
            "
            10 + 20
            (10 + 20)
            {10 + 20}
            ",
            "
            30
            30
            30
            ",
          ],
        "
        This can be used for grouping/precedence (most naturally fits with parentheses).
        ",
        code?
          .[
            "(2 + 3) * 4",
            20,
          ],
      ],
      [
        style: 40 bold,
        color: colors?.red,
        Combining,
      ],
      [
        gap: 20,
        "
        Underlying everything above is the concept of 'combining' expressions together, which happens when two expressions are written next to each other in Maraca.
        ",
        "
        Multiple expressions next to each other are combined pairwise, from left to right, so the following are equivalent.
        ",
        code?
          .[
            "
            a b c d
            (((a b) c) d)
            ",
          ],
        "
        For every pair, the operation applied depends on the types being combined (out of nil, value, and list).
        ",
        [
          style: 18 bold,
          "nil/value - nil/value",
        ],
        "
        Combining nil and value expressions joins the string values together, treating nil as the empty string. If neither value is nil and there are any spaces between the expressions, a single space is added between the strings.
        ",
        code?
          .[
            "
            Hello   world
            \\£(10 + 20)
            \"\" XYZ (5 / 2)
            ",
            "
            Hello world
            £30
            XYZ 2.5
            ",
          ],
        [
          style: 18 bold,
          "nil/value - list",
        ],
        "
        Combining nil or a value with a list performs a key lookup on the list. The expressions can be either way round.
        ",
        code?
          .[
            "
            (1 + 1) [a, b, c]
            [x: a, y: b] x
            (1 == 2) [: 10, true: 20]
            ",
            "
            b
            a
            10
            ",
          ],
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          "The dot operator",
        ],
        "
        The dot operator also performs combination, but at a lower precedence than direct combinations. This is useful for avoiding lots of parentheses, for example the following are equivalent.
        ",
        code?
          .[
            "
            (User?)(Profile)(Last name)
            User?.Profile.Last name
            ",
          ],
        "When used between values, no space is added.",
        code?
          .[
            "Hello.world",
            Helloworld,
          ],
      ],
    ],
  ],
}