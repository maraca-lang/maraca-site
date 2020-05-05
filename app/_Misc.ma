@Util
.Stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: @Util.Colors.red.@parseColor,
          'font-weight': bold,
        ],
      "Build blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use blocks for both the key and value to set multiple values at once:",
      ],
      @Example.['[[First name, Last name]: [Joe, Evans], Age: 32]'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Setting a block to a blank key copies everything from one block into
        another (keyed values override, unkeyed ones follow existing ones):",
      ],
      @Example
      .[
        '[First name: Laura, Age: 25, : [First name: Tara, Last name: Wilson]]',
        '[One, Two, : [Three, Four]]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Pairs to be set are matched by key, and unmatched keys are ignored:",
      ],
      @Example
      .[
        '[
          Age: 47,
          [First name: Name]:
            [First name: James, Middle name: Michael, Last name: Baker]
        ]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "The <: @Util.Format.[':=', keyword]/> shorthand sets a key to its own
        value, letting you copy specific values from a block:",
      ],
      @Example
      .[
        '[First name:=]',
        '[
          Age: 47,
          [First name:=, Last name:=]:
            [First name: James, Middle name: Michael, Last name: Bakes],
        ]',
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Remove keys completely by copying in each item:",
      ],
      @Example
      .[
        '[A: Sue, B: Bob, C: Joe]
        .[Person=>> : [@Person]]',
      ],
    ],
  ],
]