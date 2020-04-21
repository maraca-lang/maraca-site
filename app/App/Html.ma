Util?
.Stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: Util?.Colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Data as HTML",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Data can be mapped to HTML, with each block becoming an element, and
        the nil key determining the type (div if blank):",
      ],
      Example?
      .[
        '[
          style: [padding: 5px 10px],
          Hello,
          [:span, style: [\'font-weight\': bold], World],
        ]',
        html: true,
        width: 55,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Transform data into elements, set initial values on the transformer to
        define the containing element, and use the index if needed, for example
        to set alternating colors using the modulo operator
        (<: Util?.Format.[\%, operator]/>):",
      ],
      Example?
      .[
        '[Item 1, Item 2, Item 3]
        .[: ul, id: \'item-list\', item=>> [: li, item?]]',
        '[Item 1, Item 2, Item 3]
        .[: table, item=> i=> [: tr, style: [background: (i? % 2 = 2, red, => blue)], [: td, item?]]]'
        ,
        html: true,
        width: 55,
      ],
    ],
    ` [Item 1, Item 2, Item 3] `,
    [
      [
        style: ['padding-bottom': 10px],
        "Use double quotes with angle blocks inside to embed inline elements
        within text content (any gaps inside double quotes become single
        spaces):",
      ],
      Example?
      .[
        '[
          id: banner,
          "Welcome to <:span, class: bold, our app/>, we hope you like it!"
        ]',
        html: true,
        width: 55,
      ],
    ],
  ],
]