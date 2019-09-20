{
  [_, page]: #url,
  #title("Render | Maraca"),
  [
    x: 1000,
    pad: 50 10,
    cols: all,
    gap: 40,
    ("render-"{page?, overview})?,
    [
      x: 0.25,
      style: bold,
      [
        fill: 0 0 98,
        round: 10,
        pad: 15,
        gap: 0,
        ~:
          [
              [Overview],
              [Styling, styling],
              [Layout, layout],
              [Reactivity, reactivity],
            ][
              [text, url]=>>
                [
                  pad: 10,
                  click? | [render, url?] -> #url,
                  fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                  color: (page? == url?, colors?.red, => colors?.green),
                  text?,
                ],
            ],
      ],
    ],
  ],
}