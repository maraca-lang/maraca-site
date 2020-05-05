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
      "Running code",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Run a value as Maraca code, optionally passing in any values that
        should be available:",
      ],
      @Example.['>>\'5 * 8\'', '[Name: Kelly]>>\'Hi (@Name)\'', width: 70],
    ],
    [
      [style: ['padding-bottom': 10px], "Run code entered by the user:"],
      @Example
      .[
        '(
          code:~ \'3 + 7\',
          [
            [
              : input,
              value: @code,
              style: [padding: 10px, background: gold],
            ],
            Output\\: (>>@code),
          ],
        )',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Run user calculations on data, using the
        <: @Util.Format.[':=@', keyword]/> shorthand to copy existing values
        into the code input:",
      ],
      @Example
      .[
        '(
          input: [data: [43, 22, 55], sum: @sum, average: @average, minimum: @minimum, maximum: @maximum],
          code:~ \'@data.@sum\',
          [
            [
              : input,
              value: @code,
              style: [padding: 10px, background: gold],
            ],
            Output\\: (@input>>@code),
          ],
        )',
        width: 70,
        render: true,
      ],
    ],
  ],
]