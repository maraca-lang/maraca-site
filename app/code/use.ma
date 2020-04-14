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
      "Using blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use a <: util?.prismchar.[\., operator]/> to get a value from a block,
        with integers for unkeyed values, and missing keys returning nil:",
      ],
      example?
      .[
        '[First name: Thomas, Last name: Dawson, Age: 62].Last name',
        '[Monday, Tuesday, Wednesday].2',
        '[Name: Lucy].Address',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Add a default for missing keys, and add a label for the provided key to
        turn the default into a function:",
      ],
      example?
      .[
        '[Name: Lucy, => Data missing\\!].Address',
        '[Name: Lucy, Field=> {Field?} value missing\\!].Address',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use blocks for both the function label and the input to create a
        function of multiple values:",
      ],
      example?
      .[
        '[[Title:=, Name:=]=> Hi {Title?} {Name?}\\!].[Title: Ms, Name: Harriet]'
      ,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "If none of the inputs might be nil, you can match the values by
        position rather than by key (if any values are nil, they will be removed
        and the remaining inputs will match wrong):",
      ],
      example?.['[[Title, Name]=> Hi {Title?} {Name?}\\!].[Ms, Harriet]'],
    ],
  ],
]