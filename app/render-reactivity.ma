[
  gap: 40,
  [style: 40 bold, color: colors?.red, Reactivity],
  [
    gap: 25,,

    "Where relevant, component properties are reactive, updating automatically
    in response to events and user input. These reactive streams are what you
    use to build interactivity into your UI.",
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, "Hover & focus"],
    "Set the 'hover' and 'focus' properties to nil to watch for changes to a
    box's state. The value can then be used elsewhere, for example to change the
    background color.",
    code2?.["[ pad: 10, fill: 50 70 (hover?, 80, =\> 70), Hello, ]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, "Height & width"],
    "Similarly, set the 'height' and 'width' properties to nil to watch for
    changes to a box's size.",
    code2?.["[ pad: 10, fill: 50 70 70, Width\\: {width?}, ]"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Inputs],
    "Use the 'input' property to create a text input field. An input field can't
    have any children.",
    code2?
      .[
        "{ value: , [ gap: 15, [ pad: 10, fill: 0 0 (focus?, 80, =\> 90), input:
        value?, ], Value\\: {value?}, ] }",
      ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Clicking],
    "The click value can be used to trigger other actions.",
    code2?
      .[
        "{ count: 1, [ gap: 15, [ pad: 10, fill: 80 70 70, Click me, click? |
        count? + 1 -\> count?, ], Count\\: {count?}, ] }",
      ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Enter key],
    "The enter value fires when the enter key is pressed.",
    code2?
      .[
        "{ value: , saved: , [ gap: 15, [ pad: 10, fill: 0 0 (focus?, 80, =\>
        90), input: value?, enter? | value? -\> saved?, ], Saved\\: {saved?}, ]
        }",
      ],
  ],
]
