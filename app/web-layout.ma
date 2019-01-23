[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Layout,
  ],
  [
    gap: 25,
    "
    Maraca-render uses a column based layout system, using the 'cols' property to set the number of columns.
    ",
    code2?
      .[
        "
        [
          cols: 1,
          Hello,
          world,
        ]
        ",
      ],
    "With multiple columns, the children fill them left-to-right.",
    code2?
      .[
        "
        [
          cols: 2,
          A,
          B,
          1,
          2,
        ]
        ",
      ],
    "The 'gap' property can be used to add spacing between the children.",
    code2?
      .[
        "
        [
          gap: 30,
          Hello,
          world,
        ]
        ",
      ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Inline,
    ],
    "
    As a special case, if neither the 'cols' or 'gap' properties are set, and the children are values (not lists), then they will render inline.
    ",
    code2?
      .[
        "
        [
          Hello,
          world,
        ]
        ",
      ],
    "
    To make a sub-list display inline, add the 'text' tag. This is useful if you want to customise the text but keep it inline (e.g. links within text).
    ",
    code2?
      .[
        "
        [
          Hello,
          [: text, world],
        ]
        ",
      ],
  ],
]