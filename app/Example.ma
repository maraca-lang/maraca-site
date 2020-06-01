[
  [width: w, noprettier:=, html:=, render:=, nooutput:=, => items]=>
    [
      style: [padding: 10px 0],
      [
        : table,
        cellSpacing: 10,
        style:
          [
            width: 100\%,
            'max-width': (@nooutput = true, 400px),
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
                  'border-radius': 10px (@nooutput, 10px, => 0) 0 0,
                  width: {@w, 50}\%,
                  padding: 6px 10px,
                ],
              Code,
            ],
            (
              ! @nooutput,
              [
                : td,
                style: ['border-radius': 0 10px 0 0, padding: 6px 10px],
                ({@html, @render}, HTML, => Value),
              ],
            ),
          ],
        ],
        @items
        .[
          : tbody,
          v=> i=>
            :
              (
                text: ([=>> ].@v, @v.1, => @v),
                code: ([=>> ].@v, @v.2, => @v),
                [
                  [
                    : tr,
                    style: [height: 3px, background: white],
                    [: td],
                    (! @nooutput, [: td]),
                  ],
                  [
                    : tr,
                    [
                      : td,
                      style: [padding: 6px 10px, 'vertical-align': top],
                      @Code block.[code: @text, noprettier:@],
                    ],
                    (
                      ! @nooutput,
                      [
                        : td,
                        style:
                          [
                            padding: (@render, 10, => 6)px 10px,
                            'vertical-align': top,
                          ],
                        (
                          eval:
                            [
                              First name: John,
                              Last name: Smith,
                              Age: 43,
                              env: prod,
                              sum:@,
                              average:@,
                              minimum:@,
                              maximum:@,
                              tick:@,
                            ]
                              >>
                              @code,
                          (
                            @render,
                            @eval,
                            =>
                              @Code block
                              .[
                                code: @eval.(@html, @printhtml, => @print),
                                html:@,
                              ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
        ],
      ],
    ],
]