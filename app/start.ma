{
  [page]:: #url,
  [
    style: Montserrat 18,
    color: 0 0 20,
    [
      cols: all,
      style: 18 bold,
      color: colors?.green,
      width: 1000,
      height: middle,
      pad: 10 5,
      [
        cols: all,
        gap: 50,
        width: left,
        height: middle,
        [
          cols: all,
          width: left,
          gap: 15,
          height: middle,
          click: #url,
          value: [],
          pad: 5,
          [image: "../img/maraca.png", width: 18],
          [
            style: 26,
            color: colors?.red,
            Maraca,
          ],
        ],
        [
          cols: all,
          gap: 30,
          width: left,
          ::
            [[Docs, docs], [Web, web], [Try, try]][
                [text, url]=>>
                  [
                    pad: 0 5,
                    click: #url,
                    value: [url?],
                    hover: ,
                    [
                      pad: 0 0 2,
                      fill:
                        ({page? == url?, hover?}, colors?.green, => 0 0 100),
                      [
                        pad: 5 0 3,
                        fill: 0 0 100,
                        text?,
                      ],
                    ],
                  ],
              ],
        ],
      ],
      [
        width: 150,
        [
          width: right,
          pad: 5,
          click: #url,
          value: "https://github.com/kalambo/maraca",
          GitHub,
        ],
      ],
    ],
    page?
      .[
        : home?,
        docs:=?,
        web:=?,
        try:=?,
      ],
  ],
}