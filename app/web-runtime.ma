[
  gap: 40,
  [style: 40 bold, color: colors?.red, Runtime],
  [
    gap: 25,,

    "The core maraca runtime takes a Maraca script and runs it directly, outputting either a single JSON snapshot, or a stream of JSON data.",
    "This output can then be used directly, or piped into another library such as Maraca-render.",
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
    gap: 25,,

    [style: 26 bold, color: colors?.red, Api],
    [
      : code,
      lang: js,
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      pad: 10,
      "import maraca from 'maraca';

      // snapshot
      const data = maraca(config, source);

      // stream
      maraca(config, source, update);",
    ],
  ],
]