[
  #title(Maraca),
  width: 750,
  pad: 50 10,
  gap: 40,
  [
    gap: 20,
    [image: "../img/maraca.png", width: 40],
    [style: 50 bold center, color: colors?.red, Maraca],
    [
      style: 20 bold center,
      color: colors?.green,
      "The dynamic structured data language",
    ],
  ],
  [
    gap: 20,
    "Maraca is a lightweight, embeddable, declarative language for defining & manipulating dynamic structured data.",
    "Applicable to a wide range of environments & circumstances:",
    [
      gap: 10,
      ::
        [
            "Stateful UI",
            "Database querying",
            "Configuration files",
            "And more...",
          ][v=>> [style: bullet, v?]],
    ],
  ],
  code?
    .[
      "{
        count: #tick % 2,
        [
          test,
          count?.[
            0: hello,
            1: world,
          ],
        ],
      }",
    ],
  [
    gap: 30,
    [style: 28 bold, color: colors?.red, Key features],
    [
      cols: equal,
      gap: 40,
      ::
        [
            [
              Dynamic,
              "The output of a Maraca program is a changing stream of structured data.",
            ],
            [
              Concise,
              "Minimal syntax, and a single data structure for both indexes and keys.",
            ],
            [
              Powerful,
              "Seamlessly combine declarative, imperative and functional coding paradigms.",
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
    [style: 28 bold, color: colors?.red, Roadmap],
    [
      gap: 20,
      [style: bold 20, color: colors?.green, Current status],
      [
        gap: 15,
        ::
          [
              "Alpha, working towards v1",
              "Finalising core syntax",
              "Initial js/web runtime",
              "Initial js/web renderer and bootstrapper",
            ][v=>> [style: bullet, v?]],
      ],
    ],
    [
      gap: 20,
      [style: bold 20, color: colors?.green, Up next],
      [
        gap: 15,
        ::
          [
              "Specify and complete v1 syntax",
              "Improve js/web runtime performance",
              "Improve js/web renderer and bootstrapper",
            ][v=>> [style: bullet, v?]],
      ],
    ],
    [
      gap: 20,
      [style: bold 20, color: colors?.green, Future goals],
      [
        gap: 15,
        ::
          ["Built Macara-to-SQL converter", "Runtimes for other languages"][
              v=>> [style: bullet, v?],
            ],
      ],
    ],
  ],
]