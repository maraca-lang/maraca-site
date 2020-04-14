[
  args=>
    {
      [width: w, noprettier:=, html:=, render:=, => items]: args?,
      [
        : table,
        cellSpacing: 10,
        style:
          [
            width: 100\%,
            background: \#f9f9f9,
            'border-radius': 10px,
            'font-family': 'Source Code Pro',
            'font-size': 16px,
            'font-weight': bold,
            'table-layout': fixed,
          ],
        [
          : thead,
          style: [background: \#f1f1f1, color: \#c6c6c6, 'font-style': italic],
          [
            : tr,
            [
              : td,
              style:
                [
                  'border-radius': 10px 0 0 0,
                  width: {w?, 50}\%,
                  padding: 6px 10px,
                ],
              Input,
            ],
            [
              : td,
              style: ['border-radius': 0 10px 0 0, padding: 6px 10px],
              Output,
            ],
          ],
        ],
        [
          : tbody,
          :
            items?
            .[
              v=> i=>
                :
                  [
                    [
                      : tr,
                      style: [height: 3px, background: white],
                      [: td],
                      [: td],
                    ],
                    [
                      : tr,
                      [
                        : td,
                        style: [padding: 6px 10px, 'vertical-align': top],
                        codeblock?.[code: v?, noprettier:=?],
                      ],
                      [
                        : td,
                        style:
                          [
                            padding: (render?, 10, => 6)px 10px,
                            'vertical-align': top,
                          ],
                        {
                          eval:
                            [
                              First name: John,
                              Last name: Smith,
                              Age: 43,
                              env: prod,
                              sum:=?,
                              average:=?,
                              minimum:=?,
                              maximum:=?,
                              tick:=?,
                            ]
                              >>
                              v?,
                          (
                            render?,
                            eval?,
                            =>
                              codeblock?
                              .[
                                code: eval?.(html?, printhtml?, => print?),
                                html:=?,
                              ],
                          ),
                        },
                      ],
                    ],
                  ],
            ],
        ],
      ],
    },
]