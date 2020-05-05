@Util
.Stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: @Util.Colors.red.@parseColor,
          'font-weight': bold,
        ],
      "Live values",
    ],
    [
      [style: ['padding-bottom': 10px], "Values can change over time:"],
      @Example.['@tick', width: 70],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "In this way, element properties update in response to user
        interactions, such as the <: @Util.Format.[value, keyword]/> property of
        an input element:",
      ],
      @Example
      .[
        '(
          name:~ ,
          [
            [
              : input,
              value: @name,
              placeholder: \'Type your name...\',
              style: [padding: 10px, background: gold],
            ],
            Name\\: (@name),
          ],
        )',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use ‘A <: @Util.Format.[\|, operator]/> B
        <: @Util.Format.['->', operator]/> C’ to watch a value (A) for changes,
        and when it is true to push an update (B) to another value (C):",
      ],
      @Example
      .[
        '(
          count:~ 0,
          [
            mouse:~ ,
            @mouse.left = down | @count + 1 -> @count,
            style: [padding: 10px, background: coral],
            Clicked (@count) times,
          ]
        )',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Getting a property in an element only works if the same key hasn’t
        previously been set in an outer block, and if you aren’t getting it from
        inside a nested block (like the style), otherwise you need to set it to
        nil on the element first:",
      ],
      @Example
      .[
        '[
          : input,
          focus:~ ,
          placeholder: (@focus, \'Now type...\', => \'Click here...\'),
          style: [padding: 10px, background: (@focus, orange, => gold)],
        ]',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 5px],
        "The live values available on all elements are:",
      ],
      [
        : ul,
        style:
          [
            'list-style-type': disc,
            'padding-left': 21px,
            'font-family': 'Source Code Pro',
          ],
        [
          : li,
          "<: @Util.Format.[box, keyword]/>: <: @Util.Format.[top, number]/>,
          <: @Util.Format.[left, number]/>, <: @Util.Format.[height, number]/>,
          <: @Util.Format.[width, number]/> (number)",
        ],
        [
          : li,
          "<: @Util.Format.[mouse, keyword]/>: <: @Util.Format.[x, number]/>,
          <: @Util.Format.[y, number]/> (number) &
          <: @Util.Format.[left, number]/>, <: @Util.Format.[right, number]/>,
          <: @Util.Format.[middle, number]/> (down / up / nil)",
        ],
      ],
      [style: ['padding-bottom': 5px, 'padding-top': 15px], "And on inputs:"],
      [
        : ul,
        style:
          [
            'list-style-type': disc,
            'padding-left': 21px,
            'font-family': 'Source Code Pro',
          ],
        [: li, "<: @Util.Format.[value, keyword]/> (text)"],
        [: li, "<: @Util.Format.[focus, keyword]/> (true / nil)"],
        [: li, "<: @Util.Format.[keys, keyword]/> (key codes: down / up / nil)"]
        ,
      ],
    ],
  ],
]