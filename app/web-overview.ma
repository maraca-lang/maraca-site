[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Overview,
  ],
  [
    gap: 25,
    "
    Maraca can be used in JavaScript simply to generate dynamic JSON data, or to power a stateful HTML/CSS interface.
    ",
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      "Maraca App",
    ],
    "
    The easiest way to use Maraca for JavaScript is with Maraca App, a helper package which sets up a full web development environment (Webpack etc), so you can dive straight in writing your app with Maraca.
    ",
    "This is similar to packages like create-react-app and Gatsby.",
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      color: colors?.green,
      pad: 10,
      "yarn install maraca-app",
    ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Core runtime,
    ],
    "
    For more custom use, the core maraca runtime library takes a Maraca script and runs it directly, outputting either a single JSON snapshot, or a stream of JSON data.
    ",
    "
    This output can then be used directly, or piped into another library such as Maraca-render.
    ",
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      color: colors?.green,
      pad: 10,
      "yarn install maraca",
    ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Maraca Render,
    ],
    "
    The Maraca-App environment uses the maraca-render package to transform the output into an HTML/CSS interface.
    ",
    "This is similar to React-DOM.",
    "
    Values are simply displayed as text, while lists a transformed into components, with indexed values as children (sub-components) and other values as properties.
    ",
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      color: colors?.green,
      pad: 10,
      "yarn install maraca-render",
    ],
  ],
]