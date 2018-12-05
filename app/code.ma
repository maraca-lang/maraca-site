[
  [text, input, output]=>
    [
      : row,
      gap: 40,
      [
        width: 0.5,
        style: bullet,
        text?,
        pad: 10 0,
      ],
      [
        width: 0.5,
        style: Source Code Pro bold exact,
        fill: 0 0 98,
        round: 5,
        pad: 10,
        [
          : row,
          gap: 20,
          [
            width: 0.5,
            color: colors?.green,
            input?,
          ],
          (
            output?,
            [
              width: 0.5,
              style: right,
              color: 0 0 80,
              output?,
            ],
          ),
        ],
      ],
    ],
]