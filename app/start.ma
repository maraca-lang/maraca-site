{
  [page]: #url,
  [
    style: Montserrat 18,
    color: 0 0 20,
    [
      style: 18 bold,
      color: colors?.green,
      gap: 10,
      cols: all,
      x: 1000,
      pad: 10 5,
      [
        cols: all,
        gap: 50,
        x: left,
        [
          cols: all,
          gap: 15,
          x: left,
          pad: 5,
          click? | [] -> #url,
          [image: "../img/maraca.png", x: 18, y: middle],
          [style: 26, color: colors?.red, Maraca, y: middle],
        ],
        [
          cols: all,
          gap: 30,
          x: left,
          y: middle,
          ~:
            [
              [Setup, setup],
              [Docs, docs],
              [Render, render],
              [Guides, guides],
              [Try, try],
            ]
            .[
              [text, url]=>>
                [
                  pad: 0 5,
                  hover: ,
                  click? | [url?] -> #url,
                  [
                    pad: 0 0 2,
                    fill: ({page? == url?, hover?}, colors?.green, => 0 0 100),
                    [pad: 5 0 3, fill: 0 0 100, text?],
                  ],
                ],
            ],
        ],
      ],
      [
        x: 150,
        y: middle,
        [
          x: right,
          click? | "https://github.com/maraca-lang" -> #url,
          pad: 5,
          GitHub,
        ],
      ],
    ],
    page?.[: home?, setup:=?, docs:=?, render:=?, guides:=?, try:=?],
  ],
}