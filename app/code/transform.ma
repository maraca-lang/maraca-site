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
      "Transforming blocks",
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
        "Items transformed to nil are removed, so filter items by using a
        transformer that changes some items to nil, and leaves the rest the
        unchanged:",
      ],
      example?
      .[
        '[A: [Name: Roger, Age: 58], B: [Name: Emma, Age: 24], C: [Name: Issy, Age: 41]]
        .[Person=>> (Person?.Age > 30, Person?)]',
      ],
    ],
  ],
]