[
  text=>
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      ~:
        [Input, Output]
        .[
          v=> i=>
            [
              x: (i? == 1, => 0.35),
              style: italic,
              color: 0 0 80,
              fill: 0 0 95,
              pad: 10,
              v?,
            ],
        ],
      [: code, style: 15, pad: 10, text?],
      [style: Montserrat 18 normal, color: 0 0 20, pad: 10, text? $ []],
    ],
]