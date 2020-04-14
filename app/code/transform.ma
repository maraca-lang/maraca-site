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
      "Transform blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use a double arrow to create a transformer, which takes a block and
        applies a function to each of its items:",
      ],
      example?.['[Emma, Roger, Issy].[Name=>> Hi {Name?}\\!]'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Turn the double arrow into two arrows to also access the keys:",
      ],
      example?
      .[
        '[Emma, Roger, Issy].[Name=> Key=> Hi {Name?}\\, you\\’re number {Key?}]'
      ,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Transformed items keep the same key, but you can set items to new keys,
        or copy in each item to remove the keys completely:",
      ],
      example?
      .[
        '[
          A: [Name: Sue],
          B: [Name: Bob],
          C: [Name: Joe],
        ].[Person=> Key=> Person {Key?}: Person?]',
        '[
          A: [Name: Sue],
          B: [Name: Bob],
          C: [Name: Joe],
        ].[Person=>> : [Person?]]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Set an initial value and keep setting the same key to transform a block
        into a single value:",
      ],
      example?.['[1, 2, 3, 4, 5].[sum: 0, num=>> sum: sum? + num?]'],
    ],
  ],
]