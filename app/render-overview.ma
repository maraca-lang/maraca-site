[
  gap: 40,
  [style: 40 bold, color: colors?.red, Overview],
  [
    gap: 25,,

    "Maraca-Render transforms a Maraca stream into a UI, taking full advantage of the dynamic structured data features of the Maraca language (somewhat similar to the relationship between React and React-DOM).",,

    "Currently, this is available for web, with Maraca-Render outputting HTML & CSS.",
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Lists as components],,

    "Maraca-Render interprets Maraca lists as components, with indexed values as children (sub-components) and other values as properties. A custom component can be specified using the nil key, otherwise a default 'box' component is used.",,

    "Loosely, this turns Maraca files into a sort of dynamic XML. For example, the following are conceptually equivalent:",
    [
      cols: equal,
      style: Source Code Pro bold exact,
      fill: 0 0 98,
      round: 10,
      [[: code, pad: 10, "[pad: 10, Hello, [:panel,style: bold, World]]"]],
      [
        [
          : code,
          lang: html,
          pad: 10,
          "<box pad=""10"">
            Hello
            <panel style=""bold"">
              World
            </panel>
          </box>",
        ],
      ],
    ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Dynamic streams],,

    "The key difference of course is that Maraca files are dynamic, not just a static description of a data structure like XML. This allows for changes and reactivity within components to be expressed directly:",
    code2?
      .[
        "[
          pad: 10,
          fill: (#tick * 5) 80 80,
          (hover?, Hello'!, => Hover me)
        ]",
      ],
  ],
]
