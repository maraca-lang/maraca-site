{
  code:
    [
      input=>
        [
          : row,
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
  #title("Maraca App | Maraca"),
  [
    style: Montserrat 16,
    color: 0 0 20,
    width: 700,
    pad: 50 10,
    gap: 50,
    [
      gap: 30,
      [
        style: 50 bold,
        color: colors?.red,
        Maraca App,
      ],
      [
        "
        Maraca is a data manipulation language, but has no opinions about what data is used for. Maraca App is an environment for using Maraca to create web apps.
        ",
      ],
      [
        style: 40 bold,
        color: colors?.red,
        Renderer,
      ],
      [
        gap: 20,
        "The Maraca App renderer turns Maraca data into a web interface.",
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          Values,
        ],
        "Values are simply displayed.",
        code?."Hello there",
      ],
      [
        gap: 20,
        [
          style: 26 bold,
          color: colors?.red,
          Lists,
        ],
        "
        Lists are turned into components in the interface, with the non-integer keyed values describing properties of the components, and the integer keyed values as the children, or sub-components.
        ",
        [
          style: 18 bold,
          Boxes and layout,
        ],
        "
        By default, a list creates a box the full width of its container (or the page for the first list).
        ",
        "Values in a list are displayed inline, immediately after each other.",
        code?
          ."
          [
            Hello,
            there,
          ]
          ",
        "Sub-lists in a list are displayed in a stack.",
        code?
          ."
          [
            [Hello],
            [there],
          ]
          ",
        "
        To make a sub-list display inline, add the inline tag to the nil key. This is useful if you want to style the contents but keep it inline.
        ",
        code?
          ."
          [
            Hello,
            [: inline, there],
          ]
          ",
        "
        To separate the children, add the gap property, which creates a gap of that many pixels between them. This will also force non-list children to display in a stack.
        ",
        code?
          ."
          [
            gap: 30,
            Hello,
            there,
          ]
          ",
        "To separate the values horizontally, add the row tag to the nil key.",
        code?
          ."
          [
            : row,
            gap: 30,
            Hello,
            there,
          ]
          ",
        "
        Add the table tag to create a table. All its children must be lists with the same number of items, which will become rows with matched widths.
        ",
        code?
          ."
          [
            : table,
            [A, B, C],
            [1, 2, 3],
          ]
          ",
        [
          style: 18 bold,
          Styling text,
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
          Styling boxes,
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
        [
          style: 18 bold,
          Images,
        ],
        "Use the image key to create an image.",
        code?
          ."
          [
            image: ""https://picsum.photos/200"",
          ]
          ",
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
  ],
}