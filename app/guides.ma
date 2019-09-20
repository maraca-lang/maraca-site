{
  [_, page]: #url,
  #title("Guides | Maraca"),
  [
    x: 1000,
    pad: 50 10,
    cols: all,
    gap: 40,
    ("guides-"{page?, data})?,
    [
      x: 0.25,
      style: bold,
      [
        fill: 0 0 98,
        round: 10,
        pad: 15,
        gap: 0,
        ~:
          [[Data Operations], [Todo App, todo]][
              [text, url]=>>
                [
                  pad: 10,
                  click? | [guides, url?] -> #url,
                  fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                  color: (page? == url?, colors?.red, => colors?.green),
                  text?,
                ],
            ],
      ],
    ],
  ],
}