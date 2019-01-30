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
            v=>>
              [
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
                  [
                    pad: (i? == 1, 10, => 5) 10 10,
                    v?,
                  ],
                  [
                    color: 0 0 50,
                    pad: (i? == 1, 10, => 5) 10 10,
                    print:
                      ##(v?)
                        [User: [Profile: [First name: John, Last name: Smith]]],
                  ],
                ],
          ],
    ],
]