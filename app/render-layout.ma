[
  gap: 40,
  [style: 40 bold, color: colors?.red, Layout],
  [
    gap: 25,,

    'Maraca render uses a column based layout system, using the ‘cols’ property
    to set the number of columns.',
    code2?
    .[
      "[
        cols: 1,
        Hello,
        world,
      ]",
    ],
    'With multiple columns, the children fill them left-to-right.',
    code2?
    .[
      "[
        cols: 2,
        A,
        B,
        1,
        2,
      ]",
    ],
    'Settings cols to ‘all’ creates a single row, i.e. automatically setting the
    number of columns to the number of children.',
    code2?
    .[
      "[
        cols: all,
        1,
        2,
        ABC,
      ]",
    ],
    'Settings cols to ‘equal’ does the same as ‘all’, as well as setting the
    widths to be equal.',
    code2?
    .[
      "[
        cols: equal,
        1,
        2,
        ABC,
      ]",
    ],
    'Settings cols to ‘rows’ treats the children as rows, rather than cells.',
    code2?
    .[
      "[
        cols: rows,
        [A, B],
        [1, 2],
      ]",
    ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Positioning],,

    'The size and alignment of a component within its parent is set with the ‘x’
    and ‘y’ properties.',
    'These may have a numeric value, to set the height or width, and one of
    left/middle/right or top/middle/bottom respectively, to set the alignment.',
    code2?
    .[
      "[
        cols: all,
        [style: 30, A],
        [fill: 0 80 80, x: 150, y: middle, B],
      ]",
    ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Box model],,

    'Components use a very simple box model with only ‘pad’ and ‘gap’ properties
    for creating spacing. In addition, text within a box will reach to the edges
    (or the pad / gap if provided), so a component with 20px text and no pad
    will be 20px high.',,

    'The ‘pad’ property creates spacing around a component’s children.',
    code2?
    .[
      "[
        pad: 10,
        fill: 0 80 80,
        Hello world
      ]",
    ],,

    'The ‘gap’ property can be used to add spacing between the children.',
    code2?
    .[
      "[
        gap: 20,
        [fill: 0 80 80, Hello],
        [fill: 0 80 80, World],
      ]",
      "[
        cols: 2,
        gap: 20,
        [fill: 0 80 80, A],
        [fill: 0 80 80, B],
        [fill: 0 80 80, C],
        [fill: 0 80 80, D],
      ]",
    ],,

    'Multiple values are provided in top/left/bottom/right order for pad, and
    vertical/horizontal for gap.',
    code2?
    .[
      "[
        pad: 5 20 10,
        fill: 0 80 80,
        Hello world,
      ]",
      "[
        cols: 2,
        gap: 5 10,
        [fill: 0 80 80, A],
        [fill: 0 80 80, B],
        [fill: 0 80 80, C],
        [fill: 0 80 80, D],
      ]",
    ],,

    'Borders are created by nesting components.',
    code2?
    .[
      "[
        pad: 5,
        fill: 0 80 40,
        [pad: 10, fill: 0 80 80, Hello world],
      ]",
    ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Inline],
    'As a special case, if neither the ‘cols’ or ‘gap’ properties are set, and
    the children are values (not lists), then they will render inline.',
    code2?
    .[
      "[
        Hello,
        world,
      ]",
    ],
    'To make a sub-list display inline, add ‘flow’ to the style property. This
    is useful if you want to customise the text but keep it inline (e.g. links
    within text).',
    code2?
    .[
      "[
        \"Hello \",
        [style: flow bold, world],
      ]",
    ],
  ],
]