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
      "Use blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use a <: util?.prismchar.[\., operator]/> to get a value from a block,
        with integers for unkeyed values:",
      ],
      example?
      .[
        '[First name: Thomas, Last name: Dawson, Age: 62].Last name',
        '[Monday, Tuesday, Wednesday].2',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Missing keys return nil, or a default can be provided:",
      ],
      example?
      .['[Name: Lucy].Address', '[Name: Lucy, => Data missing\\!].Address'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Add a label for the provided key to create a function, and use blocks
        for both the function label and the input key to create a function of
        multiple values:",
      ],
      example?
      .[
        '[Name: Lucy, Field=> {Field?} value missing\\!].Address',
        '[[Title, Name]=> Hi {Title?} {Name?}\\!].[Ms, Harriet]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Match function inputs by key, especially for values that may be nil
        (otherwise nils are removed and inputs are matched unexpectedly):",
      ],
      example?.['[[Title:=, Name:=]=> Hi {Title?} {Name?}\\!].[Name: Harriet]'],
    ],
  ],
]