[
  Row:
    [
      [items, spacing, wide]=>
        items?
        .[
          style: [display: table, width: (wide?, 100\%, => auto)],
          x=> i=>
            [
              style:
                [
                  display: 'table-cell',
                  'vertical-align': middle,
                  'padding-left': (i? ! 1, spacing?),
                ],
              x?,
            ],
        ],
    ],
  Stack:
    [
      [spacing, items]=>
        items?.[x=> i=> [style: ['padding-top': (i? ! 1, spacing?)], x?]],
    ],
  Colors: [green: 145 85 50, red: 35 85 50],
  Format:
    [
      [text, type]=>
        [
          : span,
          style: ['font-family': 'Source Code Pro', 'font-weight': bold],
          class: token {type?},
          text?,
        ],
    ],
]