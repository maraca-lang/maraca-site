{
  code:
    [
      input=>
        [
          cols: all,
          gap: 20,
          [
            style: Source Code Pro bold exact,
            fill: 0 0 98,
            round: 5,
            pad: 10,
            width: 0.6,
            color: colors?.green,
            input?,
          ],
          [
            fill: 0 0 98,
            round: 5,
            pad: 10,
            width: 0.4,
            ##(input?) [],
          ],
        ],
    ],
  #title("Render | Maraca"),
  [
    style: Montserrat 16,
    color: 0 0 20,
    width: 700,
    pad: 50 10,
    gap: 30,
    [
      style: 50 bold,
      color: colors?.red,
      Render,
    ],
    [
      gap: 20,
      "Maraca-render uses Maraca data to create a web interface.",
      "
      Values are simply displayed as text, while lists create components, with indexed values as children (sub-components) and other values as properties.
      ",
    ],
    [
      gap: 20,
      [
        style: 26 bold,
        color: colors?.red,
        Layout,
      ],
      "
      Maraca-render uses a column based layout system, using the 'cols' property to set the number of columns.
      ",
      code?
        ."
        [
          cols: 1,
          Hello,
          there,
        ]
        ",
      "With multiple columns, the children fill them left-to-right.",
      code?
        ."
        [
          cols: 2,
          A,
          B,
          1,
          2,
        ]
        ",
      "The 'gap' property can be used to add spacing between the children.",
      code?
        ."
        [
          gap: 30,
          Hello,
          there,
        ]
        ",
      [
        style: 18 bold,
        Inline rendering,
      ],
      "
      As a special case, if neither the 'cols' or 'gap' properties are set, and the children are values (not lists), then they will render inline.
      ",
      code?
        ."
        [
          Hello,
          there,
        ]
        ",
      "
      To make a sub-list display inline, add the 'text' tag. This is useful if you want to customise the text but keep it inline.
      ",
      code?
        ."
        [
          Hello,
          [: text, there],
        ]
        ",
    ],
    [
      gap: 20,
      [
        style: 26 bold,
        color: colors?.red,
        Styling,
      ],
      [
        style: 18 bold,
        Text,
      ],
      "
      To set the style of the text in a box, use the style and color properties.
      ",
      "
      The style property may include a numeric font size, any combination of the words normal/bold/italic, and optionally one of left/center/right.
      ",
      "
      The color property expects three numeric values, for hue (0 to 100 circular), chromacity/saturation (0 to 100-150), and lightness (0 to 100-150).
      ",
      code?
        ."
        [
          style: 30 center bold italic,
          color: 60 80 50,
          Hello,
        ]
        ",
      [
        style: 18 bold,
        Boxes,
      ],
      "There are a number of properties for styling boxes.",
      "
      For any directional property that applies to the different sides of the box, you can enter 1-4 numeric values, for (top/bottom/all) (left/right) (bottom) (right).
      ",
      "
      The pad property adds a gap around the contents of the box (directional).
      ",
      "
      The fill property adds a background color, using the same color syntax as for text.
      ",
      "
      The round property adds corner rounding (directional - anticlockwise from top left).
      ",
      code?
        ."
        [
          pad: 30 10,
          fill: 50 70 70,
          round: 20,
          Hello,
        ]
        ",
    ],
    [
      gap: 20,
      [
        style: 26 bold,
        color: colors?.red,
        Images,
      ],
      "Use the image key to create an image.",
      code?
        ."
        [
          image: ""https://picsum.photos/200"",
        ]
        ",
    ],
    [
      gap: 20,
      [
        style: 26 bold,
        color: colors?.red,
        Interaction,
      ],
      [
        style: 18 bold,
        "Hover & focus",
      ],
      "
      Set the hover and/or focus keys to nil to watch for changes to a box's state. The value can then be used elsewhere, for example to change the background color.
      ",
      code?
        ."
        [
          hover: ,
          pad: 10,
          fill: 50 70 (hover?, 60, => 70),
          Hello,
        ]
        ",
      [
        style: 18 bold,
        "Height & width",
      ],
      "
      Similarly, set the height and/or width keys to nil to watch for changes to a box's size.
      ",
      code?
        ."
        [
          width: ,
          pad: 10,
          fill: 50 70 70,
          Width': {width?},
        ]
        ",
      [
        style: 18 bold,
        Inputs,
      ],
      "
      Use the input property to create a text input field. An input field can't have any children.
      ",
      code?
        ."
        {
          value: ,
          [
            gap: 15,
            [
              pad: 5,
              focus: ,
              fill: 0 0 (focus?, 80, => 90),
              input: value?,
            ],
            Value': {value?},
          ]
        }
        ",
      [
        style: 18 bold,
        "Click event",
      ],
      "
      If the click property is set, then the current value of the value property (nil if not set) will be pushed to the provided stream when the box is clicked.
      ",
      code?
        ."
        {
          count: 1,
          [
            gap: 15,
            [
              click: count?,
              pad: 10,
              fill: 80 70 70,
              value: count? + 1,
              Hello,
            ],
            Count': {count?},
          ]
        }
        ",
    ],
  ],
}