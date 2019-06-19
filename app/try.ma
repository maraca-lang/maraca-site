{
  value: "1 + 1",
  open: true,
  printview: true,
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
          style: center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click? | !open? -> open?,
          (open?, Hide, => Show) Code,
        ],
        (
          open?,
          [
            pad: 5 15,
            style: center,
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
        x: right,
        [
          pad: 5 15,
          style: center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click? | !printview? -> printview?,
          "Toggle Print / Render",
        ],
      ],
    ],
    [
      cols: equal,
      (open?, [pad: 0 5 5 5, fill: 0 0 60, style: 14, [: editor, value:=?]]),
      [
        fill: 0 0 98,
        pad: 10,
        [:: (printview?, [: print, style: 18, value? $ []], => [value? $ []])],
      ],
    ],
  ],
}