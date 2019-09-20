[
  gap: 40,
  [style: 40 bold, color: colors?.red, Metacode],
  [
    gap: 25,,

    'Maraca has an eval operator, which takes a Maraca script on the left, and
    an evaluation context on the right. The context is used as the initial
    context for the evaluation, assigned to ‘?’ as usual.',,

    'Note that the evaluation is isolated from the context outside it, unless
    passed in explicitly. However custom streams (both @ and #) are available.',
    ,

    code?.["\"1 + 1\" $ []", "\"x? + 1\" $ [x: 10]", "\"#tick\" $ []"],,

    'The script itself can also be computed dynamically, allowing for
    metacoding.',,

    code?
    .[
      "{
        operator: [\\+, \\-, \\*, \\/].(#tick % 4),
        script: (10 {operator?} 2),
        Script\\: {script?}\\
        Result\\: {script? $ []}
      }",
    ],
  ],
]