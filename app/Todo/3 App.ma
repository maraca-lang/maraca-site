Util?
.Stack
.[
  15px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: Util?.Colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Starting the app",
    ],
    [
      "To start, let’s outline a very simple, static, version of our app. We’ll
      add a title, an input for entering new tasks, and a list of tasks.",
    ],
    Example?
    .[
      '[
        [: h1, Todos],
        [
          : input,
          placeholder: \'Enter new task...\',
          style: [padding: 10px, background: gold],
        ],
        [Task 1],
        [Task 2],
        [Task 3],
      ]',
      render: true,
      width: 70,
    ],
    "Now, let’s start making our app interactive. First we’ll make the input
    change color when we click and focus it.",
    [
      "For this, we’ll set the <: Util?.Format.[focus, keyword]/> property of
      the input to a special type of value that can change over time, which will
      then automatically update to match the state of the input. We do this by
      using <: Util?.Format.[':~', keyword]/> instead of
      <: Util?.Format.[\:, keyword]/> when we set the value.",
    ],
    [
      "Then, we access this value in another part of our data with
      <: Util?.Format.[\?, string]/>, and use a new ‘round’ type of block,
      written using parentheses, along with a fallback value, to create an ‘if A
      then B else C’ statement, written
      <
        : span,
        style: ['font-weight': bold, 'font-family': Source Code Pro],
        innerHTML: ['(A, B, => C)'].prism?,
      />.
      (Round blocks can be used in more general ways, but this is all we need
      for now.)",
    ],
    "Try clicking on the input to see it change color when focused.",
    Example?
    .[
      [
        '[
          ...,
          [
            : input,
            placeholder: \'Enter new task...\',
            focus:~ ,
            style: [padding: 10px, background: (focus?, orange, => gold)],
          ],
          ...,
        ]',
        '[
          [: h1, Todos],
          [
            : input,
            placeholder: \'Enter new task...\',
            focus:~ ,
            style: [padding: 10px, background: (focus?, orange, => gold)],
          ],
          [Task 1],
          [Task 2],
          [Task 3],
        ]',
      ],
      render: true,
      width: 70,
    ],
  ],
]