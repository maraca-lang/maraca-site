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
      "Creating state",
    ],
    "Now, let’s say we want to put a line through each task that has been done.
    So we’ll need some value which holds this information, and then we can use
    it to set the style of the task. We’ll start with Task 1.",
    Example?
    .[
      [
        '[
          ...,
          [
            style: [\'text-decoration\': (done?, \'line-through\')],
            Task 1,
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
          {
            done: true,
            [
              style: [\'text-decoration\': (done?, \'line-through\')],
              Task 1,
            ]
          },
          [Task 2],
          [Task 3],
        ]',
      ],
      render: true,
      width: 70,
    ],
    [
      "So where does <: Util?.Format.['done?', string]/> come from? To hold
      state like this, we use a ‘curly’ block, written using braces, which only
      returns its (first) unkeyed value, allowing us to create ‘hidden’ keyed
      values.",
    ],
    Example?
    .[
      [
        '[
          ...,
          {
            done: true,
            [
              style: [\'text-decoration\': (done?, \'line-through\')],
              Task 1,
            ],
          },
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
          {
            done: true,
            [
              style: [\'text-decoration\': (done?, \'line-through\')],
              Task 1,
            ]
          },
          [Task 2],
          [Task 3],
        ]',
      ],
      render: true,
      width: 70,
    ],
    "Now, we want this value to toggle when we click on the task.",
    [
      "First, we use <: Util?.Format.[':~', keyword]/> again to create values
      that can change over time, both for the state, and for the
      <: Util?.Format.[mouse, keyword]/> property, which will update when the
      mouse is clicked on the element. The value of
      <: Util?.Format.['mouse?', string]/> will be a block with a value for each
      mouse button, so we use a <: Util?.Format.[\., operator]/> to access the
      part we want.",
    ],
    [
      "Then, we use the the ‘equals’ (<: Util?.Format.[\=, operator]/>) and
      ‘not’ (<: Util?.Format.[\!, operator]/>) operators, along with a new
      construct
      <
        : span,
        style: ['font-weight': bold, 'font-family': Source Code Pro],
        innerHTML: ['A | B -> C'].prism?,
      />,
      which means ‘when A push B into C’, to watch for the left mouse to be
      clicked down, and when it is to set the state to its opposite value.",
    ],
    "Try clicking on Task 1 to see it in action.",
    Example?
    .[
      [
        '[
          ...,
          {
            done:~,
            [
              mouse:~ ,
              mouse?.left = down | ! done? -> done?,
              style: [\'text-decoration\': (done?, \'line-through\')],
              Task 1,
            ]
          },
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
          {
            done:~,
            [
              mouse:~ ,
              mouse?.left = down | ! done? -> done?,
              style: [\'text-decoration\': (done?, \'line-through\')],
              Task 1,
            ]
          },
          [Task 2],
          [Task 3],
        ]',
      ],
      render: true,
      width: 70,
    ],
  ],
]