[
  gap: 40,
  [style: 40 bold, color: colors?.red, Semilists],
  [
    gap: 25,,

    "The fact that nil values are removed from lists can be used to form AND/OR boolean logic expressions. These constructs each have a shorthand form using a different bracket type, called semilists.",
    "These semilists can then also be used in other ways, such as for grouping expressions, writing imperative code, and forming ternary operations.",,

    [style: 18 bold, And],
    "Accessing the last indexed value of a list is equivalent to an 'and' operation on all its values - it will return non-nil (true) only if all of the values are non-nil. (More precisely, it will return the last value if all are non-nil, otherwise nil).",
    code?.["3.[!1, 3 < 4, 5 == 5]", "2.[1 == 1, 2 < 4]"],
    "A parenthesis semilist is shorthand for this 'and' pattern.",
    code?.["(!1, 3 < 4, 5 == 5)", "(1 == 1, 2 < 4)"],
    "Note that this syntax ignores function declarations when counting indices.",
    code?.["(a, b, => c)"],,

    [style: 18 bold, Or],
    "Accessing the first indexed value of a list is equivalent to an 'or' operation on all its values - it will return non-nil (true) if any of the values are non-nil. (More precisely, it will return the first non-nil value in the list).",
    code?.["1.[!1, 3 < 4, 5 == 5]", "1.[1 == 2, 4 < 2]"],
    "A braces semilist is shorthand for this 'or' pattern.",
    code?.["{!1, 3 < 4, 5 == 5}", "{1 == 2, 4 < 2}"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, "Common uses"],,

    [style: 18 bold, Grouping],
    "For lists with a single value, both semilists translate into accessing the 1 key, ie. the single value itself. Therefore they are equivalent to writing that value directly.",
    code?.["10 + 20", "(10 + 20)", "{10 + 20}"],
    "This can be used for grouping / precedence.",
    code?.["(2 + 3) * 4"],,

    [style: 18 bold, Imperative code],
    "You can write code in an imperative style using an OR semilist, by using all items for key assignments apart from the final return statement.",
    code?
      .[
        "{
          x: 2,
          y: 3,
          x? * y?,
        }",
      ],,

    [style: 18 bold, Ternary],
    "You can create a ternary expression using an AND semilist with a default.",
    code?.["(1 == 2, x, => y)"],
  ],
]