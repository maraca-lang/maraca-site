Util?
.Stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: Util?.Colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Filter",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "True / false tests (<: Util?.Format.[\=, operator]/>,
        <: Util?.Format.[\!, operator]/> for any values,
        <: Util?.Format.[\<, operator]/>, <: Util?.Format.[\>, operator]/>,
        <: Util?.Format.[\<\=, operator]/>, <: Util?.Format.[\>\=, operator]/>
        for numbers) return empty (nil) for false:",
      ],
      Example?.['8 > 2.5', 'cat = dog', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "The ‘not’ test (<: Util?.Format.[\!, operator]/>) returns true if the
        values are different, or if used on another test returns true if that
        test is false:",
      ],
      Example?.['cat ! dog', '! 5 = 7', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Round brackets return true if
        <: span, style: ['font-weight': bold], all/> terms are true:",
      ],
      Example?.['(1 = 2, 3 < 4)', '(5 = 5, 7 < 8)', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Curly brackets return true if
        <: span, style: ['font-weight': bold], any/> term is true:",
      ],
      Example?.['{1 = 2, 3 < 4}', '{5 = 6, 7 > 8}', width: 60],
    ],
    [
      style:
        [
          border: 3px solid ((145 30 90).parseColor?),
          padding: 30px,
          'margin-top': 10px,
          'border-radius': 10px,
          height: 303px,
        ],
      [style: ['padding-bottom': 20px], "Try changing the filter:"],
      {
        data:
          [
            [First name: John, Last name: Smith, Age: 43],
            [First name: Anne, Last name: Thompson, Age: 22],
            [First name: Sarah, Last name: Davies, Age: 55],
          ],
        columns: [First name, Last name, Age],
        filter: '{First name? = Anne, Age? > 50}',
        [
          style: ['font-family': 'Source Code Pro', 'font-size': 16px],
          [
            : input,
            focus: ,
            mouse: ,
            base: ({mouse?, focus?}, (145 30 95), => (145 30 90)),
            style:
              [
                background: base?.parseColor?,
                'font-weight': bold,
                padding: 4px 8px,
                display: block,
                'border-radius': 10px,
                border: 2px solid {(focus?, (145 85 50), => base?).parseColor?},
              ],
            value: filter?,
          ],
          [style: [height: 10px]],
          [
            : table,
            style: [width: 100\%],
            [
              : thead,
              style: ['font-weight': bold],
              [
                : tr,
                :
                  columns?
                  .[
                    v=>>
                      [
                        : td,
                        style: ['vertical-align': middle, padding: 6px 10px],
                        v?,
                      ],
                  ],
              ],
            ],
            [
              : tbody,
              :
                data?
                .[d=>> (d?>>{filter?, 1}, d?)]
                .[d=>> : [d?]]
                .[
                  d=> i=>
                    [
                      : tr,
                      style: [background: (i? % 2 = 1, \#f1f1f1)],
                      :
                        columns?
                        .[
                          v=> i=>
                            [
                              : td,
                              style:
                                [
                                  padding: 6px 10px,
                                  'border-radius':
                                    {
                                      (i? = 1, 10px 0 0 10px),
                                      (i? = 3, 0 10px 10px 0),
                                    },
                                ],
                              d?.v?,
                            ],
                        ],
                    ],
                ],
            ],
          ],
        ],
      },
    ],
  ],
]