{
  value: "1 + 1",
  format: ,
  open: true,
  #title("Try | Maraca"),
  [
    [
      fill: 0 0 60,
      pad: 5,
      [
        cols: all,
        width: left,
        gap: 5,
        [
          pad: 5,
          hover: ,
          width: 100,
          style: center,
          color: 0 0 100,
          fill: 40 85 (hover?, 45, => 50),
          click: open?,
          value: !open?,
          (open?, Hide, => Show),
        ],
        (
          open?,
          [
            pad: 5,
            hover: ,
            width: 100,
            style: center,
            color: 0 0 100,
            fill: 40 85 (hover?, 45, => 50),
            click: format?,
            Format,
          ],
        ),
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
        ##(value?) [],
      ],
    ],
  ],
}