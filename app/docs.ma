{
  [_, page]:: #url,
  #title("Docs | Maraca"),
  [
    width: 1000,
    pad: 50 10,
    cols: all,
    gap: 40,
    ("docs-"{page?, overview})?,
    [
      width: 0.25,
      style: bold,
      [
        fill: 0 0 98,
        round: 10,
        pad: 15,
        gap: 0,
        ::
          [
              [Overview],
              [Values, values],
              [Lists, lists],
              [Combining, combining],
              [Operators, operators],
              [Context, context],
              [Semilists, semilists],
              [Functions, functions],
              [Streams, streams],
              [Data, data],
            ][
              [text, url]=>>
                [
                  pad: 10,
                  click: ,
                  #url; click? & [docs, url?],
                  hover: ,
                  fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                  color: (page? == url?, colors?.red, => colors?.green),
                  text?,
                ],
            ],
      ],
    ],
  ],
}