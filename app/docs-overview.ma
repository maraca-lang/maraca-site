[
  gap: 40,
  [style: 40 bold, color: colors?.red, Overview],
  [
    gap: 25,,

    "Maraca is a lightweight, embeddable language. This documentation describes the core syntax and features of the language.",,

    [style: 18 bold, Values],
    "All values in Maraca are treated as text/strings, and lazily converted to other types when required.",
    code?.[Hello, 20],,

    [style: 18 bold, Lists],
    "Inspired by Lua, Maraca has only one data structure - the list - which combines together keys & indices, and is ordered. Lists can have a default value for when a missing key is accessed.",
    code?
      .[
        "[
          x: 1,
          y: 2,
          hello,
          world,
          => 20,
        ]",
      ],,

    [style: 18 bold, Combining],
    "At the core of Maraca is the combine operator, which is applied whenever two expressions are directly next to each other, with different cases depending on the types of the arguments.",
    code?.["Hello world", "[x: a, y: b] y"],,

    [style: 18 bold, Operators],
    "Maraca has all the usual arithmetic and comparison operators.",
    code?.["1 + 2", "5 > 3"],,

    [style: 18 bold, Context],
    "The context list '?' accesses previously defined values, allowing for imperative-style code.",
    code?
      .[
        "[
          x: 2,
          y: 3,
          x? * y?,
        ]",
      ],,

    [style: 18 bold, Shorthands],
    "Lists ignore entries which are nil (equivalent to false), which allows for shorthand syntaxes for boolean logic - parentheses for AND, braces for OR.",
    code?.["(1 == 2, 3 < 4)", "{1 == 2, 3 < 4}"],
    "These can then also be used in other ways, such as for grouping expressions and writing imperative code.",
    code?
      .[
        "(2 + 3) * 4",
        "{
          x: 2,
          y: 3,
          x? * y?,
        }",
      ],
    [style: 18 bold, Functions],
    "Lists defaults can be a function of the key. There is also a 'map' form which applies the function individually to every key / value pair of the provided list.",
    code?.["[x: a, v=> v? + 5] 10", "[5, 10].[k=> v=> [k?, v?]]"],,

    [style: 18 bold, Streams],
    "Expressions in Maraca are dynamic streams which can changes over time. There are two core ways of creating streams in Maraca, which are defined as part of your Maraca environment.",
    code?.["@in 10 minutes", "#url"],
    [style: 18 bold, Data],
    "In Maraca, common data operations such as sorting, filtering and slicing data are achived through common patterns built from the core syntax.",
    code?
      .[
        "#data",
        "#data
        .[v=>> (v?.Name ! Bob, v?)]",
      ],
  ],
]