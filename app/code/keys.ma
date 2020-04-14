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
      "Using keys",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "By default transformed items keep the same key, but you can set items
        to new keys, which also causes them to sort differently:",
      ],
      example?
      .[
        '[A: [Name: Sue], B: [Name: Bob], C: [Name: Joe]]
        .[Person=>> {Person?.Name}: Person?]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "The <: util?.prismchar.[\-, operator]/> operator works on text values,
        and causes them to sort in reverse, similar to numbers:",
      ],
      example?
      .[
        '[A: [Name: Sue], B: [Name: Bob], C: [Name: Joe]]
        .[Person=>> -{Person?.Name}: Person?]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Set an initial value and keep setting the same key to transform a block
        into a single value:",
      ],
      example?.['[1, 2, 3, 4, 5].[Sum: 0, Number=>> Sum: Sum? + Number?]'],
    ],
  ],
]