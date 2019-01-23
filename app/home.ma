[
  #title(Maraca),
  width: 750,
  pad: 50 10,
  gap: 40,
  [
    gap: 15,
    [image: "./maraca.png", width: 40],
    [
      style: 50 bold center,
      color: colors?.red,
      Maraca,
    ],
    [
      style: 20 bold center,
      color: colors?.green,
      "The dynamic structured data language",
    ],
  ],
  [
    gap: 15,
    "Maraca is...",
    "
    Intuitive, human-focused, lightweight, embeddable, functional, reactive, dynamic, structured, data, text based, simple, keyword free, blend of sql/json/react
    ",
  ],
  code?
    .[
      "
      [
        1 + 2,
      ]
      ",
    ],
  [
    gap: 20,
    [style: 24 bold, color: colors?.red, Key features],
    [
      cols: equal,
      gap: 40,
      "Dynamic / reactive / functional",
      "Text based / no keywords / no quotes around text",
      "Single data structure / lists / context",
    ],
  ],
  [
    gap: 20,
    [style: 24 bold, color: colors?.red, "Goals / roadmap"],
    "Current: alpha, javascript, render/app",
    "Next: finish core syntax/features, performance, continue render/app",
    "Future: sql/querying, other languages/envs",
  ],
]