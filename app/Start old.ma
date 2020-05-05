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
                "Level 1. Formula",
              ],
              [
                style: ['font-weight': bold, 'padding-bottom': 16px],
                "Use Maraca to work with existing data.",
              ],
              "Any data can be connected to Maraca so you can do calculations,
              create filters, sort, and use built-in functions - a little like
              using a spreadsheet.",
            ],
            @Formula.Calculate,
            @Formula.Filter,
            @Formula.Summarise,
          ],
        ],
      data:
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
                "Level 2. Data",
              ],
              [
                style: ['font-weight': bold, 'padding-bottom': 16px],
                "Use Maraca to compose structured data.",
              ],
              "At its heart, Maraca is a simple language for defining data, with
              a clean syntax, and the ability to work with logic, variables, and
              much more.",
            ],
            @Data.Basics,
            @Data.If,
            @Data.Use,
          ],
        ],
      code:
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
                "Level 3. Code",
              ],
              [
                style: ['font-weight': bold, 'padding-bottom': 16px],
                "Use Maraca to write dynamic code.",
              ],
              "Once you’re comforable writing data, use functions and
              transformers to generate and modify your data dynamically.",
            ],
            @Code.Use,
            @Code.Transform,
            @Code.Keys,
          ],
        ],
      app:
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
                "Level 4. App",
              ],
              [
                style: ['font-weight': bold, 'padding-bottom': 16px],
                "Use Maraca to develop interactive apps.",
              ],
              "Finally, map your dynamic data to HTML, and respond to user
              actions, to create an interactive web app.",
            ],
            @App.Html,
            @App.Live,
            @App.Code,
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