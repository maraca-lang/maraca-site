{
  value: "1 + 1",
  format: ,
  open: true,
  print: true,
  #title("Try | Maraca"),
  [
    width: 1000,
    [
      fill: 0 0 60,
      pad: 5,
      cols: all,
      [
        cols: all,
        width: left,
        gap: 5,
        [
          pad: 5 15,
          hover: ,
          style: center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click: open?,
          value: !open?,
          (open?, Hide, => Show) Code,
        ],
        (
          open?,
          [
            pad: 5 15,
            hover: ,
            style: center,
            color: 0 0 100,
            fill: 40 85 (hover?, 45, => 50),
            click: format?,
            Format Code,
          ],
        ),
      ],
      [
        cols: all,
        width: right,
        [
          pad: 5 15,
          hover: ,
          style: center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click: print?,
          value: !print?,
          "Toggle Print / Render",
        ],
      ],
    ],
    [
      cols: all,
      (
        open?,
        [
          pad: 0 5 5 5,
          fill: 0 0 60,
          style: 14,
          [: code, value:=?, format:=?],
        ],
      ),
      [
        fill: 0 0 98,
        pad: 10,
        [
          :: (print?, [print: ##(value?) []], => [##(value?) []]),
        ],
      ],
    ],
  ],
}