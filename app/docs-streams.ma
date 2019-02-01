[
  gap: 40,
  [style: 40 bold, color: colors?.red, Streams],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Custom],
    "The # and @ symbols are custom operators which can be defined as part of your Maraca environment.",,

    [style: 18 bold, Library values],
    "The # symbol is used for your custom library, such as live values (e.g. #url) or methods (e.g. #size).",
    code?.["#url"],,

    [style: 18 bold, Interpreted values],
    "The @ symbol (also @@, @@@) is used for your custom interpreted values (e.g. times and locations).",
    code?.["@tomorrow morning"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Triggers],
    "These operators related to treating the stream of outputs from an expression as events for triggering other effects.",,

    [style: 18 bold, Trigger],
    "The trigger operator outputs a snapshot of the value on the right everytime the value on the left changes.",
    code?.["@@@1000 & 2"],,

    [style: 18 bold, Copy],
    "The copy operator emits all outputs from the value on the right into the value on the left, and returns nil.",
    code?
      .[
        "[
          x: hello,
          x?; @@@1000,
        ]",
      ],,

    [style: 18 bold, Triggering updates],
    "Together, the trigger and copy operators allow for updating values in response to changes to other values.",
    code?
      .[
        "[
          x: 0,
          x?; @@@1000 & x? + 10,
        ]",
      ],
  ],
]