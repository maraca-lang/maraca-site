{
  [_, page]:: #url,
  #title("Web | Maraca"),
  [
    width: 1000,
    pad: 50 10,
    cols: all,
    gap: 40,
    ("web-"{page?, overview})?,
    [
      width: 0.25,
      style: bold,
      [
        fill: 0 0 98,
        round: 10,
        pad: 15,
        ::
          [[Overview]][
              [text, url]=>>
                [
                  pad: 10,
                  click: ,
                  #url; click? & [web, url?],
                  hover: ,
                  fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                  color: (page? == url?, colors?.red, => colors?.green),
                  text?,
                ],
            ],
        [pad: 30 10 10, style: 14, SETUP],
        ::
          [[App, app], [Runtime, runtime]][
              [text, url]=>>
                [
                  pad: 10,
                  click: ,
                  #url; click? & [web, url?],
                  hover: ,
                  fill: ({page? == url?, hover?}, 0 0 95, => 0 0 98),
                  color: (page? == url?, colors?.red, => colors?.green),
                  text?,
                ],
            ],
        [pad: 30 10 10, style: 14, RENDER],
        ::
          [[Layout, layout], [Styling, styling], [Interaction, interaction]][
              [text, url]=>>
                [
                  pad: 10,
                  click: ,
                  #url; click? & [web, url?],
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