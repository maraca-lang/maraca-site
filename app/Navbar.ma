{
  link:
    [
      [text, link]=>
        [
          : a,
          href: \/{link?},
          stopMouse: [left],
          mouse:~ ,
          mouse?.left = down | [link?] -> url?,
          style:
            [
              display: block,
              'text-decoration': none,
              color: Util?.Colors.green.parseColor?,
              padding: 0 5px,
            ],
          [
            : span,
            style:
              [
                display: 'inline-block',
                padding: 2px 0 0,
                'border-bottom':
                  2px solid
                  (
                    {mouse?, url?.1 = link?},
                    Util?.Colors.green.parseColor?,
                    => white,
                  ),
              ],
            text?,
          ],
        ],
    ],
  [
    style:
      [
        'max-width': 1000px,
        margin: 0 auto,
        'font-size': 18px,
        'font-weight': bold,
        padding: 10px 5px,
      ],
    Util?
    .Row
    .[
      [
        Util?
        .Row
        .[
          [
            [
              : a,
              href: \/,
              stopMouse: [left],
              mouse:~ ,
              mouse?.left = down | [] -> url?,
              style:
                [
                  display: block,
                  'margin-right': 20px,
                  'font-size': 26px,
                  color: Util?.Colors.red.parseColor?,
                  'text-decoration': none,
                  padding: 0 5px,
                ],
              [
                : span,
                style: [display: table],
                [
                  : span,
                  style:
                    [
                      display: 'table-cell',
                      'vertical-align': middle,
                      'padding-right': 15px,
                    ],
                  [
                    : img,
                    src: '../img/maraca.png',
                    style: [display: block, width: 18px],
                  ],
                ],
                [
                  : span,
                  style: [display: 'table-cell', 'vertical-align': middle],
                  Maraca,
                ],
              ],
            ],
            [Tutorial].link?,
          ],
          30px,
        ],
        [style: [float: right], [Setup, setup].link?],
      ],
      0px,
      true,
    ],
  ],
}