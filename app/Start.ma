[
  style: ['font-family': Montserrat, 'font-size': 18px, color: \#333],
  @title.Maraca,
  @Navbar,
  [
    style: ['max-width': 750px, padding: 40px 10px, margin: 0 auto],
    @url
    .1
    .[
      '':
        @Util
        .Stack
        .[
          40px,
          [
            [
              [
                style:
                  [
                    'font-size': 40px,
                    color: @Util.Colors.red.@parseColor,
                    'font-weight': bold,
                    'padding-bottom': 12px,
                  ],
                "Tutorial",
              ],
              "The Maraca language is a simple language for defining dynamic
              (changing) data. This data can be used in various ways, in this
              tutorial we’ll generate HTML to make a simple todo list app.",
            ],
            @Todo.1 Data,
            @Todo.2 Html,
            @Todo.3 App,
            @Todo.4 State,
            @Todo.5 Transform,
            @Todo.6 Update,
            @Todo.7 Finish,
          ],
        ],
      setup:
        @Util
        .Stack
        .[
          40px,
          [
            [
              [
                style:
                  [
                    'font-size': 40px,
                    color: @Util.Colors.red.@parseColor,
                    'font-weight': bold,
                    'padding-bottom': 12px,
                  ],
                "Setup",
              ],
              [
                style: ['font-weight': bold, 'padding-bottom': 16px],
                "Setup Maraca on your computer.",
              ],
              "Maraca is a lightweight, embeddable language. Currently, the only
              language environment supported is JavaScript & web. Follow the
              instructions below to get started.",
            ],
            @Setup,
          ],
        ],
    ],
  ],
]