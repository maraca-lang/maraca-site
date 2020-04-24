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
      "Summarise",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Square brackets group values together (called a block):",
      ],
      Example?.['[1, 2, 3]', '[hello, world]', width: 60],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Like data, get functions with
        <
          : span,
          style: ['font-family': 'Source Code Pro', 'font-weight': bold],
          innerHTML: \?.prism?,
        />,
        and use a dot to apply them:",
      ],
      Example?.['[4, 87, 45].maximum?', '[10, 4, 27, 51].average?', width: 60],
    ],
    [
      style:
        [
          border: 3px solid ((145 30 90).parseColor?),
          padding: 30px,
          'margin-top': 10px,
          'border-radius': 10px,
        ],
      [
        style: ['padding-bottom': 20px],
        "Try changing the summary formula (data fields now contain all values
        from the column):",
      ],
      {
        data:
          [
            [First name: John, Last name: Smith, Age: 43],
            [First name: Anne, Last name: Thompson, Age: 22],
            [First name: Sarah, Last name: Davies, Age: 55],
          ],
        columns: [First name, Last name, Age],
        formula:~ 'Age?.sum?',
        [
          style: ['font-family': 'Source Code Pro', 'font-size': 16px],
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
                    v=> i=>
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
          [style: [height: 22px]],
          [
            : table,
            style:
              [
                width: 100\%,
                background: \#f1f1f1,
                'border-radius': 10px,
                'font-weight': bold,
              ],
            [
              : tr,
              [
                : td,
                style: [width: 50\%],
                [
                  : input,
                  focus:~ ,
                  mouse:~ ,
                  base: ({mouse?, focus?}, (145 30 95), => (145 30 90)),
                  style:
                    [
                      background: base?.parseColor?,
                      padding: 4px 8px,
                      display: block,
                      'border-radius': 10px 0 0 10px,
                      border:
                        2px solid {(focus?, (145 85 50), => base?).parseColor?},
                    ],
                  value: formula?,
                ],
              ],
              [
                : td,
                style: [padding: 6px 10px],
                innerHTML:
                  [
                    [
                      (
                        [
                          :
                            [First name, Last name, Age]
                            .[k=>> k?: data?.[v=>> v?.k?]],
                          sum:=?,
                          average:=?,
                          minimum:=?,
                          maximum:=?,
                        ]
                          >>
                          formula?,
                      )
                      .print?,
                    ]
                    .prettier?,
                  ]
                  .prism?,
              ],
            ],
          ],
        ],
      },
    ],
  ],
]