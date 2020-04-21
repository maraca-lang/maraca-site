[
  [code:=, noprettier:=, html:=]=>
    (
      code?,
      [
        : pre,
        box: ,
        [
          : code,
          style:
            [
              'font-family': 'Source Code Pro',
              'font-size': 16px,
              'font-weight': bold,
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