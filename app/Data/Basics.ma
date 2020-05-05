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
      "Values & blocks",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Join together adjacent values (gaps become a single space), using
        <: @Util.Format.[\\, string]/> or single quotes for special characters
        (not letters or numbers), and brackets to group:",
      ],
      @Example
      .['\\£25', '\'132-3004-132\'', 'Hello   (@First name)', noprettier: true],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Values in blocks can have keys, which are sorted (alphabetically) after
        unkeyed values:",
      ],
      @Example.['[Label: heights, Units: m, \'1.5\', \'1.8\', \'1.7\']'],
    ],
    [
      [style: ['padding-bottom': 10px], "Blocks can be nested:"],
      @Example
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
      @Example
      .[
        '[: list, Item 1, Item 2, Item 3]',
        '[a, , b]',
        '[`TODO: Add middle name`, First name: Anna, Middle name: , Last name: Cook]'
        ,
      ],
    ],
  ],
]