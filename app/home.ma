[
  #title(Maraca),
  x: 750,
  pad: 50 10,
  gap: 40,
  [
    gap: 20,
    [image: "../img/maraca.png", x: 40],
    [style: 50 bold center, color: colors?.red, Maraca],
    [
      style: 20 bold center,
      color: colors?.green,
      "The dynamic structured data language",
    ],
  ],
  [
    gap: 20,
    'Maraca is a lightweight, embeddable, declarative language for defining &
    manipulating dynamic structured data.',
    'And when combined with Maraca-Render, it can be a powerful language for
    creating interactive UI, such as this site...',
  ],
  [
    gap: 30,
    [style: 28 bold, color: colors?.red, Key features],
    [
      cols: equal,
      gap: 40,
      :
        [
          [
            Dynamic,
            'The output of a Maraca program is a changing stream of structured
            data.',
          ],
          [
            Concise,
            'Minimal syntax, and a single data structure for both indexes and
            keys.',
          ],
          [
            Powerful,
            'Seamlessly combine declarative, imperative and functional coding
            paradigms.',
          ],
        ]
        .[
          [title, text]=>>
            [gap: 20, [style: bold 20, color: colors?.green, title?], text?],
        ],
    ],
  ],
  [
    gap: 30,
    [style: 28 bold, color: colors?.red, Uses],
    [
      cols: equal,
      gap: 40,
      :
        [
          [
            Data templating,
            'Run a Maraca file statically to compose a data structure, similar
            to Jsonnet.',
          ],
          [
            Coordination,
            'Concise syntax and access to context work well for high level
            configuration files.',
          ],
          [
            Interactive UIs,
            'Use with Maraca-Render to declaratively create UIs, similar to
            React and React-DOM.',
          ],
        ]
        .[
          [title, text]=>>
            [gap: 20, [style: bold 20, color: colors?.green, title?], text?],
        ],
    ],
  ],
  [
    gap: 30,
    [style: 28 bold, color: colors?.red, Getting started],,

    [
      'To get a high level overview, take a look at the
      <: link?.['Todo App Guide', [guides, todo]]/>, along with the
      <: link?.['Maraca-Render documentation', [render]]/>, to see Maraca in
      action without worrying about the precise details.',
    ],
    [
      'Quite soon however, you’ll want to read through the main
      <: link?.['Maraca Docs', [docs]]/> to see how the core language works.',
    ],
    [
      'To try out Maraca yourself, either use the
      <: link?.['Try page', [try]]/>, or follow the instructions on the
      <: link?.['Setup page', [setup]]/>.',
    ],
  ],
  [
    gap: 30,
    [style: 28 bold, color: colors?.red, Example],,

    'This basic example uses Maraca and Maraca-Render to create a colorful,
    hoverable button which increments a counter.',
    code3?
    ."{
      count: 1,
      [
        gap: 15,
        [
          pad: 10,
          fill: (#tick * 20) 80 (hover?, 80, => 70),
          round: 5,
          style: bold,
          Click me,
          click? | count? + 1 -> count?,
        ],
        Count\\: {count?},
      ]
    }",
  ],
]