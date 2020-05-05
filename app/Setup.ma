(
  link:
    [
      [text, link]=>
        [
          : a,
          href: \/(@link),
          stopMouse: [left],
          mouse:~ ,
          @mouse.left = down | [@link] -> @url,
          style:
            [
              'text-decoration': none,
              color: @Util.Colors.green.@parseColor,
              'font-weight': bold,
            ],
          @text,
        ],
    ],
  @Util
  .Stack
  .[
    40px,
    [
      @Util
      .Stack
      .[
        20px,
        [
          [
            style:
              [
                'font-size': 30px,
                color: @Util.Colors.red.@parseColor,
                'font-weight': bold,
              ],
            "JavaScript & web",
          ],
          "For all the following options, details instructions are available on
          the linked NPM package pages.",
          [style: ['font-weight': bold], "JavaScript runtime"],
          [
            "To use Maraca directly in JavaScript, install the
            <
              :
                @link
                .['maraca-js runtime', 'https://www.npmjs.com/package/maraca'],
            />.",
          ],
          [style: ['font-weight': bold], "Building web apps"],
          [
            "To use Maraca to build a web app, the simplest way to get started
            is with the
            <
              : @link.['maraca-app', 'https://www.npmjs.com/package/maraca-app']
              ,
            />
            package, which sets up everything you need (webpack, maraca-render
            etc), letting you dive right in to building your app.",
          ],
          [
            "If you need more control however, you can use the
            <
              :
                @link
                .[
                  'maraca-render',
                  'https://www.npmjs.com/package/maraca-render',
                ],
            />
            package directly to manually render your Maraca output as HTML.",
          ],
        ],
      ],
      @Util
      .Stack
      .[
        20px,
        [
          [
            style:
              [
                'font-size': 30px,
                color: @Util.Colors.red.@parseColor,
                'font-weight': bold,
              ],
            "Editor tools",
          ],
          [style: ['font-weight': bold], "Prettier"],
          [
            "There is a Prettier plugin for Maraca,
            <
              :
                @link
                .[
                  'prettier-plugin-maraca',
                  'https://github.com/maraca-lang/prettier-plugin-maraca',
                ],
            />.
            It is highly recommended to use this.",
          ],
          [style: ['font-weight': bold], "Editor extensions"],
          "There are editor extensions available for the following IDEs,
          installable using their built-in extension systems:",
          [
            : ul,
            style: ['list-style-type': disc, 'padding-left': 21px],
            [: li, "Visual Studio Code"],
          ],
        ],
      ],
    ],
  ],
)