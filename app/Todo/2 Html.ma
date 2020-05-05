@Util
.Stack
.[
  15px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: @Util.Colors.red.@parseColor,
          'font-weight': bold,
        ],
      "Generating HTML",
    ],
    "All Maraca does is output changing data, which can be used in all sorts of
    ways. For this tutorial, we’re using our data to generate HTML (using the
    maraca-render library).",
    [
      "Maraca blocks map very intuitively to HTML elements:",
      [
        : ul,
        style:
          ['list-style-type': disc, 'padding-left': 20px, 'padding-top': 5px],
        [: li, "Keyed values =\> properties"],
        [: li, "Unkeyed values =\> children"],
        [: li, "A value with a blank key =\> element type (defaults to div)"],
      ],
    ],
    @Example
    .[
      '[
        style: [margin: 5px 10px],
        Hello,
        [:span, style: [\'font-weight\': bold], World],
      ]',
      html: true,
      width: 50,
    ],
    [
      "From now on, when we’re generating HTML we’ll render the output, rather
      than showing it in code form.",
    ],
    @Example
    .[
      '[
        style: [background: coral, padding: 10px],
        Hello world,
      ]',
      render: true,
      width: 70,
    ],
  ],
]