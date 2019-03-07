[
  gap: 40,
  [style: 40 bold, color: colors?.red, Overview],
  [
    gap: 25,,

    "Maraca render is an experimental rendering system for creating UIs with Maraca, taking full advantage of the dynamic structured data features of the Maraca language.",,

    "The relationship between Maraca and Maraca render is similar to that of React and React-DOM.",,

    "Currently, this is available for web, with Maraca render outputting HTML & CSS. Loosely, this turns Maraca files into a dynamic equivalent of HTML (with inline CSS).",,

    [style: 18 bold, Components],
    "Values are simply displayed as text, while lists are transformed into components, with indexed values as children (sub-components) and other values as properties.",,

    [style: 18 bold, Interactivity],
    "Values in Maraca are streams, which allows Maraca render to provide interactivity. For example, streams can emit on events (such as clicking a component), or can track live values (such as input values and component widths).",
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Example],
    code2?
      .[
        "{
          value: ,
          [
            gap: 15,
            [
              pad: 10,
              fill: 0 0 (focus?, 80, => 90),
              input: value?,
            ],
            Value': {value?},
          ]
        }",
      ],
  ],
]