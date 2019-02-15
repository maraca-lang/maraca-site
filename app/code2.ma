[
  inputs=>
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      color: colors?.green,
      ::
        [Input, Output]
          .[
            i=> v=>
              [
                :: (i? == 1, [], => [width: 0.35]),
                style: italic,
                color: 0 0 80,
                fill: 0 0 95,
                pad: 10,
                v?,
              ],
          ],
      ::
        inputs?
          .[
            i=> v=>
              ::
                [
                  [: code, style: 18, pad: (i? == 1, 10, => 5) 10 10, v?],
                  [
                    style: Montserrat 18 normal,
                    color: 0 0 20,
                    pad: (i? == 1, 10, => 5) 10 10,
                    v? $ [User: [Profile: [Last name: Smith]]],
                  ],
                ],
          ],
    ],
]