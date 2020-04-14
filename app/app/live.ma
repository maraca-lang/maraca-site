util?
.stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: util?.colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Live values",
    ],
    [
      [style: ['padding-bottom': 10px], "Values can change over time:"],
      example?.['tick?', width: 70],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "In this way, element properties update in response to user
        interactions, such as the <: util?.prismchar.[value, keyword]/> property
        of an input element:",
      ],
      example?
      .[
        '{
          name: ,
          [
            [
              : input,
              value: name?,
              placeholder: \'Type your name...\',
              style: [padding: 10px, background: gold],
            ],
            Name\\: {name?},
          ],
        }',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use ‘A <: util?.prismchar.[\|, operator]/> B
        <: util?.prismchar.['->', operator]/> C’ to watch a value (A) for
        changes, and when it is true to push an update (B) to another value
        (C):",
      ],
      example?
      .[
        '{
          count: 0,
          [
            mouse?.left = down | count? + 1 -> count?,
            style: [padding: 10px, background: coral],
            Clicked {count?} times,
          ]
        }',
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
      example?
      .[
        '[
          : input,
          focus: ,
          placeholder: (focus?, \'Now type...\', => \'Click here...\'),
          style: [padding: 10px, background: (focus?, orange, => gold)],
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
          "<: util?.prismchar.[box, keyword]/>:
          <: util?.prismchar.[top, number]/>,
          <: util?.prismchar.[left, number]/>,
          <: util?.prismchar.[height, number]/>,
          <: util?.prismchar.[width, number]/> (number)",
        ],
        [
          : li,
          "<: util?.prismchar.[mouse, keyword]/>:
          <: util?.prismchar.[x, number]/>, <: util?.prismchar.[y, number]/>
          (number) & <: util?.prismchar.[left, number]/>,
          <: util?.prismchar.[right, number]/>,
          <: util?.prismchar.[middle, number]/> (down / up / nil)",
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
        [: li, "<: util?.prismchar.[value, keyword]/> (text)"],
        [: li, "<: util?.prismchar.[focus, keyword]/> (true / nil)"],
        [
          : li,
          "<: util?.prismchar.[keys, keyword]/> (key codes: down / up / nil)",
        ],
      ],
    ],
  ],
]