[
  gap: 40,
  [
    style: 40 bold,
    color: colors?.red,
    Styling,
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
    code2?
      .[
        "
        [
          style: 30 center bold italic,
          color: 60 80 50,
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
      Boxes,
    ],
    "There are a number of properties for styling boxes.",
    "
    For any directional property that applies to the different sides of the box, you can enter 1-4 numeric values, for (top/bottom/all) (left/right) (bottom) (right).
    ",
    "The pad property adds a gap around the contents of the box (directional).",
    "
    The fill property adds a background color, using the same color syntax as for text.
    ",
    "
    The round property adds corner rounding (directional - anticlockwise from top left).
    ",
    code2?
      .[
        "
        [
          pad: 30 10,
          fill: 50 70 70,
          round: 20,
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
      Images,
    ],
    "Use the image key to create an image.",
    code2?
      .[
        "
        [
          image: ""https://picsum.photos/200"",
        ]
        ",
      ],
  ],
]