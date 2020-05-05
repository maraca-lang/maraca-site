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
      "Using values",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Get previous values with their key and
        <: @Util.Format.[\@, punctuation]/>:",
      ],
      @Example.['[x: 3, y: @x * 5]', '[Name: Daisy, Welcome: Hello (@Name)\\!]']
      ,
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "This returns the most recent value, including from outer blocks, or
        values that may be available from outside your code:",
      ],
      @Example
      .[
        '[Name: William, Welcome: [Addressed to: @Name, Name: Billy, Text: Hello (@Name)]]'
        ,
        '[User full name: (@First name) (@Last name)]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Curly blocks return their first non-nil term, and setting a key is a
        nil term, so you can set and use ‘hidden’ values to build your data:",
      ],
      @Example
      .[
        '{1 = 2, hello, there}',
        '(
          env: dev,
          port: 3000,
          [
            id: \'405-3995-209\',
            server:
              (
                @env = dev,
                \'http://localhost:\'(@port),
                => \'http://www.server.com\',
              )
          ],
        )',
      ],
    ],
  ],
]