[
  gap: 40,
  [style: 40 bold, color: colors?.red, Styling],
  [
    gap: 25,,

    "The default 'box' component has a number of properties that can be used to style both it and it's contents.",,

    [style: 18 bold, No units],
    "Numerical values are unitless, with whole numbers interpreted as pixels, and decimals as percentages.",,

    [style: 18 bold, Directional values],
    "For any directional property that applies to the different sides of the box, you can enter 1-4 numeric values, for [top/bottom/all] [left/right] [bottom] [right].",,

    [style: 18 bold, Color format],
    "Note that colors are entered in HCL (hue/chroma/luminance), with hue scaled to 0-100.",
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Text],
    "To set the style of the text in a box, use the 'style' and 'color' properties.",
    "The style property may include:",
    [
      pad: 0 25 0 0,
      gap: 10,
      [style: bullet, "A numeric font size"],
      [style: bullet, "A second (larger) numeric line height"],
      [
        style: bullet,
        "Any combination of the words 'normal' / 'bold' / 'italic / strike'",
      ],
      [style: bullet, "One of 'left' / 'center' / 'right'"],
      [style: bullet, "The tag 'bullet' for a bullet point"],
      [style: bullet, "The tag 'password' to hide characters"],
      [style: bullet, "The tag 'flow' (see the Layout page)"],
    ],
    code2?
      .[
        "[
          style: 30 center bold italic,
          color: 60 80 50,
          Hello,
        ]",
      ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Boxes],
    "For styling boxes, the 'fill' property adds a background color, and the 'round' property adds corner rounding (directional - anticlockwise from top left).",
    code2?
      .[
        "[
          fill: 50 70 70,
          round: 10 10 0 0,
        ]",
      ],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Images],
    "Use the image key to create an image.",
    code2?
      .[
        "[
          image: ""https://picsum.photos/200"",
        ]",
      ],
  ],
]