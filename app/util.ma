[
  row:
    [
      [items, spacing, wide]=>
        [
          style: [display: table, width: (wide?, 100\%, => auto)],
          :
            items?
            .[
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
    ],
  stack:
    [
      [spacing, items]=>
        [: items?.[x=> i=> [style: ['padding-top': (i? ! 1, spacing?)], x?]]],
    ],
  colors: [green: 145 85 50, red: 35 85 50],
  prismchar:
    [
      [char, type]=>
        [
          : span,
          style: ['font-family': 'Source Code Pro', 'font-weight': bold],
          class: token {type?},
          char?,
        ],
    ],
]