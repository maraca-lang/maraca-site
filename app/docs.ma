{
  [_, page]: #url,
  #title("Docs | Maraca"),
  [
    x: 1000,
    pad: 50 10,
    cols: all,
    gap: 37,
    ("docs-"{page?, data})?,
    [
      x: 0.25,
      style: bold,
      [
        fill: 0 0 98,
        round: 10,
        pad: 15,
        gap: 0,
        :
          [
            [Data],
            [Operators, operators],
            [Combining, combining],
            [Context, context],
            [Assignment, assignment],
            [Functions, functions],
            [Logic\-lists, logic\-lists],
            [Streams, streams],
            [Metacode, metacode],
          ]
          .[
            [text, url]=>>
              [
                pad: 10,
                click? | [docs, url?] -> #url,
                fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                color: (page? == url?, colors?.red, => colors?.green),
                text?,
              ],
          ],
      ],
    ],
  ],
}