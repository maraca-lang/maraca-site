{
  value:
    "{
      count: 1,
      [
        gap: 15,
        [
          pad: 10,
          fill: (#tick * 5) 80 (hover?, 80, => 70),
          round: 5,
          style: bold,
          Click me,
          click? | count? + 1 -> count?,
        ],
        Count\\: {count?},
      ],
    }",
  open: true,
  printview: ,
  #title("Try | Maraca"),
  [
    x: 1000,
    [
      fill: 0 0 60,
      pad: 5,
      cols: equal,
      [
        cols: all,
        x: left,
        gap: 5,
        [
          pad: 5 15,
          style: bold center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click? | !open? -> open?,
          (open?, Hide, => Show) Code,
        ],
        (
          open?,
          [
            pad: 5 15,
            style: bold center,
            color: 0 0 100,
            fill: 40 85 (hover?, 45, => 50),
            click: format?,
            click? | #format.value? -> value?,
            Format Code,
          ],
        ),
      ],
      [
        cols: all,
        [
          x: left,
          pad: 5 5 5 15,
          style: bold,
          color: 0 0 100,
          (printview?, Printing, => Rendering),
        ],
        [
          x: right,
          [
            pad: 5 15,
            style: bold center,
            color: 0 0 100,
            fill: 40 85 (hover?, 45, => 50),
            click? | !printview? -> printview?,
            "Switch to" (printview?, Render, => Print),
          ],
        ],
      ],
    ],
    [
      cols: equal,
      (open?, [pad: 0 5 5 5, fill: 0 0 60, style: 14, [: editor, value:=?]]),
      [
        fill: 0 0 98,
        pad: 10,
        [~: (printview?, [: print, style: 18, value? $ []], => [value? $ []])],
      ],
    ],
  ],
}