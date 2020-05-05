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
      "Calculate",
    ],
    [
      [style: ['padding-bottom': 10px], "Write text and number values:"],
      @Example.[Hello, '\'7.5\'', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Do calculations (<: @Util.Format.[\+, operator]/>,
        <: @Util.Format.[\-, operator]/>, <: @Util.Format.[\*, operator]/>,
        <: @Util.Format.[\/, operator]/>, <: @Util.Format.[\^, operator]/>),
        using brackets to group:",
      ],
      @Example.['8 * \'2.5\'', '(3 + 5) / 2', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use <: @Util.Format.[\@, punctuation]/> to get data:",
      ],
      @Example.['@Age', '@First name', width: 60],
    ],
    [
      style:
        [
          border: 3px solid ((145 30 90).@parseColor),
          padding: 30px,
          'margin-top': 10px,
          'border-radius': 10px,
        ],
      [style: ['padding-bottom': 20px], "Try changing the formula:"],
      (
        data:
          [
            [First name: John, Last name: Smith, Age: 43],
            [First name: Anne, Last name: Thompson, Age: 22],
            [First name: Sarah, Last name: Davies, Age: 55],
          ],
        columns: [First name, Last name, Age],
        formula:~ '@Age + 10',
        [
          : table,
          style:
            [width: 100\%, 'font-family': 'Source Code Pro', 'font-size': 16px],
          [
            : thead,
            style: ['font-weight': bold],
            [
              : tr,
              :
                @columns
                .[
                  v=>>
                    [
                      : td,
                      style:
                        ['vertical-align': middle, padding: 6px 10px 16px 10px],
                      @v,
                    ],
                ],
              [
                : td,
                style: [width: 40\%, 'padding-bottom': 10px],
                [
                  : input,
                  focus:~ ,
                  mouse:~ ,
                  base: ({@mouse, @focus}, (145 30 95), => (145 30 90)),
                  style:
                    [
                      background: @base.@parseColor,
                      padding: 4px 8px,
                      display: block,
                      'border-radius': 10px,
                      border:
                        2px solid ((@focus, (145 85 50), => @base).@parseColor),
                    ],
                  value: @formula,
                ],
              ],
            ],
          ],
          [
            : tbody,
            :
              @data
              .[
                d=> i=>
                  [
                    : tr,
                    style: [background: (@i % 2 = 1, \#f1f1f1)],
                    :
                      @columns
                      .[
                        v=> i=>
                          [
                            : td,
                            style:
                              [
                                padding: 6px 10px,
                                'border-radius': (@i = 1, 10px 0 0 10px),
                              ],
                            @d.@v,
                          ],
                      ],
                    [
                      : td,
                      style: [padding: 6px 10px, 'border-radius': 0 10px 10px 0]
                      ,
                      (@d>>@formula),
                    ],
                  ],
              ],
          ],
        ],
      ),
    ],
  ],
]