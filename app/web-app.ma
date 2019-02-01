[
  gap: 40,
  [style: 40 bold, color: colors?.red, App],
  [
    gap: 25,,

    "Maraca App is a helper package which sets up a full web development environment (Webpack etc), so you can dive straight in writing your app with Maraca.",
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
    gap: 25,,

    [style: 26 bold, color: colors?.red, Directory structure],
    "Once you have install maraca-app into your Node project, you will need to create files in the following structure.",
    [
      style: Source Code Pro bold exact,
      cols: 2,
      fill: 0 0 98,
      round: 10,
      color: colors?.green,
      pad: 10,
      "- app
        start.ma
        [other maraca files...]
      - js (optional)
        components.{js,ts}
        library.{js,ts}
      favicon.ico",
    ],,

    [style: 18 bold, "Maraca files"],
    [
      "The app folder contains the Maraca files for your app, with ",
      [: text, style: bold, "start.ma"],
      "as the entrypoint.",
    ],
    [
      "Files are available to each other using the context list, for example to access a file called about.ma from another file, you would type",
      [
        : text,
        style: Source Code Pro bold exact,
        cols: 2,
        fill: 0 0 98,
        round: 10,
        color: colors?.green,
        pad: 10,
        "about?",
      ],
      '.,
    ],,

    [style: 18 bold, "Other files"],
    "The js folder / files are optional. If provided, they configure the custom components for Maraca Render and the custom library for the Maraca runtime. They can be written in JavaScript or TypeScript.",
    "The favicon.ico file is currently required, but is on the roadmap to be made optional.",
  ],
]