{
  [_, page]: #url,
  #title("Setup | Maraca"),
  [
    x: 750,
    pad: 50 10,
    gap: 40,
    [style: 40 bold, color: colors?.red, Setup],
    [
      gap: 25,,

      'Maraca is a lightweight, embeddable language. Setup instructions will
      vary depending on your environment.',
      'Currently, the only language environment supported is JavaScript & web.',
    ],
    [
      gap: 25,,

      [style: 26 bold, color: colors?.red, 'JavaScript & web'],,

      'The three main packages for using Maraca for web development (with
      approximate React equivalents) are:',
      [
        gap: 10,
        [
          style: bullet,
          link?.['maraca-js', "https://github.com/maraca-lang/maraca-js"],
          ' (react)',
        ],
        [
          style: bullet,
          link?
          .['maraca-render', "https://github.com/maraca-lang/maraca-render"],
          ' (react-dom)',
        ],
        [
          style: bullet,
          link?.['maraca-app', "https://github.com/maraca-lang/maraca-app"],
          ' (create-react-app)',
        ],
      ],,

      'The easiest way to get started is with maraca-app, which sets everything
      up (webpack, render etc) so you can write web apps just in Maraca.',,

      'Otherwise, you can use the JavaScript runtime directly and handle the
      output yourself (for example using maraca-render).',,

      [
        'There is also a webpack loader available, ',
        link?.['maraca-loader', "https://github.com/maraca-lang/maraca-loader"],
        \.,
      ],,

      'The documentation for all of these packages is on their linked GitHub
      pages.',
    ],
    [
      gap: 25,,

      [style: 26 bold, color: colors?.red, Editor tools],,

      [style: 18 bold, Prettier],
      [
        'There is a Prettier plugin for Maraca, ',
        link?
        .[
          'prettier-plugin-maraca',
          "https://github.com/maraca-lang/prettier-plugin-maraca",
        ],
        '. It is highly recommended to use this instead of manually managing
        indentation in Maraca files.',
      ],,

      [style: 18 bold, Editor extensions],
      'The following editor extensions are available:',
      [
        gap: 10,
        [
          style: bullet,
          'Visual Studio Code: ',
          link?
          .['vscode-maraca', "https://github.com/maraca-lang/vscode-maraca"],
        ],
      ],
    ],
  ],
}