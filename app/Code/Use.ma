@Util
.Stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: @Util.Colors.red.@parseColor,
          'font-weight': bold,
        ],
      "Using blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use a <: @Util.Format.[\., operator]/> to get a value from a block,
        with integers for unkeyed values, and missing keys returning nil:",
      ],
      @Example
      .[
        '[First name: Thomas, Last name: Dawson, Age: 62].Last name',
        '[Monday, Tuesday, Wednesday].2',
        '[Name: Lucy].Address',
        width: 55,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Add a default for missing keys, and add a label for the provided key to
        turn the default into a function:",
      ],
      @Example
      .[
        '[Name: Lucy, => Data missing\\!].Address',
        '[Name: Lucy, Field=> (@Field) value missing\\!].Address',
        width: 55,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use blocks for both the function label and the input to create a
        function of multiple values:",
      ],
      @Example
      .[
        '[[Title:=, Name:=]=> Hi (@Title) (@Name)\\!].[Title: Ms, Name: Harriet]'
        ,
        width: 55,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "If none of the inputs might be nil, you can match the values by
        position rather than by key (if any values are nil, they will be removed
        and the remaining inputs will match wrong):",
      ],
      @Example
      .['[[Title, Name]=> Hi (@Title) (@Name)\\!].[Ms, Harriet]', width: 55],
    ],
  ],
]