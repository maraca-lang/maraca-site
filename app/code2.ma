[
  inputs=>
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      :
        [Input, Output]
        .[
          v=> i=>
            [
              x: (i? == 1, => 0.35),
              style: italic,
              color: 0 0 80,
              fill: 0 0 95,
              pad: 10,
              round: (i? == 1, 10, => 0) 0 0 (i? == 2, 10, => 0),
              v?,
            ],
        ],
      :
        inputs?
        .[
          v=> i=>
            :
              [
                [: code, style: 18, pad: (i? == 1, 10, => 5) 10 10, v?],
                [
                  style: Montserrat 18 normal,
                  color: 0 0 20,
                  pad: (i? == 1, 10, => 5) 10 10,
                  v? $ [],
                ],
              ],
        ],
    ],
]