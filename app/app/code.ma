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
      "Running code",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Run a value as Maraca code, optionally passing in any values that
        should be available:",
      ],
      example?.['>>\'5 * 8\'', '[Name: Kelly]>>\'Hi {Name?}\'', width: 70],
    ],
    [
      [style: ['padding-bottom': 10px], "Run code entered by the user:"],
      example?
      .[
        '{
          code: \'3 + 7\',
          [
            [
              : input,
              value: code?,
              style: [padding: 10px, background: gold],
            ],
            Output\\: {>>code?},
          ],
        }',
        width: 70,
        render: true,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Run user calculations on data, using the
        <: util?.prismchar.[':=?', keyword]/> shorthand to copy existing values
        into the code input:",
      ],
      example?
      .[
        '{
          input: [data: [43, 22, 55], sum:=?, average:=?, minimum:=?, maximum:=?],
          code: \'data?.sum?\',
          [
            [
              : input,
              value: code?,
              style: [padding: 10px, background: gold],
            ],
            Output\\: {input?>>code?},
          ],
        }',
        width: 70,
        render: true,
      ],
    ],
  ],
]