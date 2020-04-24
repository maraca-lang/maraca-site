[
  [code:=, noprettier:=, html:=]=>
    (
      code?,
      [
        : pre,
        box: ,
        [
          : code,
          box:~ ,
          style:
            [
              'font-family': 'Source Code Pro',
              'font-size': 16px,
              'font-weight': bold,
              display: block,
            ],
          innerHTML:
            [
              {
                (
                  noprettier?,
                  code?,
                  =>
                    (html?, prettierhtml?, => prettier?)
                    .[code?, {box?.width / 9.5, 30}],
                ),
                _,
              },
              (html?, html),
            ]
            .prism?,
        ],
      ],
    ),
]