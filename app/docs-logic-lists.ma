[
  gap: 40,
  [style: 40 bold, color: colors?.red, Logic\-lists],
  [
    gap: 25,,

    'As well as ordinary lists, there are two special types of list, and-lists
    and or-lists. These lists are shorthand constructs which use the fact that
    nil values are removed from lists to achive ‘and’ and ‘or’ boolean logic
    (where nil is false and non-nil is true).',,

    [style: 18 bold, "And-lists"],
    'An and-list is written using parentheses, and returns true only if all of
    the values are true. More precisely, it returns the last value if all are
    true (non-nil), otherwise nil.',
    code?.["(3 > 4, 5 == 5)", "(1 == 1, 2 < 3)"],
    'This syntax is shorthand for accessing the last indexed value of a list.
    For example, the following are equivalent.',
    code?.["(5, 10)", "[5, 10].2"],
    'Note that and-lists ignore function declarations when finding the last
    item.',
    code?.["(a, b, => c)"],,

    [style: 18 bold, "Or-lists"],
    'An or-list is written using braces, and returns true if any of the values
    are true. More precisely, it returns the first true (non-nil) value in the
    list.',
    code?.["{3 < 4, 10}", "{1 == 2, 4 < 2}"],
    'This syntax is shorthand for accessing the first indexed value of a list.
    For example, the following are equivalent.',
    code?.["{5, 10}", "[5, 10].1"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Common uses],,

    'These logic-lists are useful in a wide variety of situations.',,

    [style: 18 bold, Grouping],
    'For lists with a single value, both logic-lists translate into accessing
    the 1 key, ie. the single value itself. Therefore they are equivalent to
    writing that value directly.',
    code?.["(10 + 20)", "{10 + 20}"],
    'This can be used for grouping and precedence.',
    code?.["(2 + 3) * 4"],,

    [style: 18 bold, Imperative code],
    'You can write code in an imperative style using an or-list, by using all
    items for key assignments apart from the final return statement.',
    code?.["{ x: 2, y: 3, x? * y?, }"],,

    [style: 18 bold, Ternary],
    'You can create a ternary expression using an and-list with a default.',
    code?.["(1 == 2, x, => y)"],
  ],
]