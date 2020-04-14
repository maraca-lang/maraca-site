util?
.stack
.[
  25px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: util?.colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Build blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use blocks for both the key and value to set multiple values at once:",
      ],
      example?.['[[First name, Last name]: [Joe, Evans], Age: 32]'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Setting a block to a blank key copies everything from one block into
        another (keyed values override, unkeyed ones follow existing ones):",
      ],
      example?
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
      example?
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
        "The <: util?.prismchar.[':=', keyword]/> shorthand sets a key to its
        own value, letting you copy specific values from a block:",
      ],
      example?
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
      example?
      .[
        '[A: Sue, B: Bob, C: Joe]
        .[Person=>> : [Person?]]',
      ],
    ],
  ],
]