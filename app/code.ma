[
  [text, input, output]=>
    [
      cols: equal,
      gap: 40,
      [
        style: bullet,
        text?,
        pad: 10 0,
      ],
      [
        style: Source Code Pro bold exact,
        fill: 0 0 98,
        round: 5,
        pad: 10,
        [
          cols: equal,
          gap: 20,
          [
            color: colors?.green,
            input?,
          ],
          (
            output?,
            [
              style: right,
              color: 0 0 80,
              output?,
            ],
          ),
        ],
      ],
    ],
]