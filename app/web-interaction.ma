[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Interaction,
  ],
  [
    gap: 25,
    "Intro text",
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      "Hover & focus",
    ],
    "
    Set the hover and/or focus keys to nil to watch for changes to a box's state. The value can then be used elsewhere, for example to change the background color.
    ",
    code2?
      .[
        "
        [
          hover: ,
          pad: 10,
          fill: 50 70 (hover?, 60, => 70),
          Hello,
        ]
        ",
      ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      "Height & width",
    ],
    "
    Similarly, set the height and/or width keys to nil to watch for changes to a box's size.
    ",
    code2?
      .[
        "
        [
          width: ,
          pad: 10,
          fill: 50 70 70,
          Width': {width?},
        ]
        ",
      ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Inputs,
    ],
    "
    Use the input property to create a text input field. An input field can't have any children.
    ",
    code2?
      .[
        "
        {
          value: ,
          [
            gap: 15,
            [
              pad: 10,
              focus: ,
              fill: 0 0 (focus?, 80, => 90),
              input: value?,
            ],
            Value': {value?},
          ]
        }
        ",
      ],
  ],
  [
    gap: 25,
    [
      style: 26 bold,
      color: colors?.red,
      Clicking,
    ],
    "
    If the click property is set, then the current value of the value property (nil if not set) will be pushed to the provided stream when the box is clicked.
    ",
    code2?
      .[
        "
        {
          count: 1,
          [
            gap: 15,
            [
              click: count?,
              value: count? + 1,
              pad: 10,
              fill: 80 70 70,
              Hello,
            ],
            Count': {count?},
          ]
        }
        ",
      ],
  ],
]