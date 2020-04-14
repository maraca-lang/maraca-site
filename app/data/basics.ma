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
      "Values & blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Join together adjacent values (gaps become a single space), using
        <: util?.prismchar.[\\, string]/> or single quotes for special
        characters (not letters or numbers), and brackets to group:",
      ],
      example?
      .['\\£25', '\'132-3004-132\'', 'Hello   {First name?}', noprettier: true],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Values in blocks can have keys, which are sorted (alphabetically) after
        unkeyed values:",
      ],
      example?.['[Label: heights, Units: m, 1.5, 1.8, 1.7]'],
    ],
    [
      [style: ['padding-bottom': 10px], "Blocks can be nested:"],
      example?
      .[
        '[Name: \'Jack O’Connor\', Address: [House: 4, Street: Fairlawn Road, Town: Sheffield]]'
      ,
      ],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Values can be set to a blank (nil) key, but nil values are removed,
        including comments (which show text but have a value of nil):",
      ],
      example?
      .[
        '[: list, Item 1, Item 2, Item 3]',
        '[a, , b]',
        '[`TODO: Add middle name`, First name: Anna, Middle name: , Last name: Cook]'
      ,
      ],
    ],
  ],
]