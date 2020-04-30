Util?
.Stack
.[
  15px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: Util?.Colors.red.parseColor?,
          'font-weight': bold,
        ],
      "Writing data",
    ],
    [
      "All data in Maraca is built from text values. Values using only letters
      and numbers (including decimals) can be written directly. Other characters
      must either be prefixed with a <: Util?.Format.[\\, function]/>, or part
      of a value surrounded with single quotes.",
    ],
    Example?.[Hello, 7.5, '\\£', '\'132-3004-132\'', width: 60, nooutput: true],
    [
      "Values can be built up from multiple adjacent parts, optionally separated
      by a single space.",
    ],
    Example?.['\\£25', 'Hello world', nooutput: true],
    [
      "To add structure to our data, we can group multiple values together
      inside a ‘block’, using square brackets and commas.",
    ],
    Example?.['[1, 2, 3]', '[Hello, world]', width: 60, nooutput: true],
    ["Any value in a block may also have a key, and blocks can be nested."],
    Example?
    .[
      '[
        Hello, color: red,
      ]',
      '[
        First name: Jack,
        Last name: \'O’Connor\',
        Address:
          [
            House: 4,
            Street: Fairlawn Road,
            Town: Sheffield,
          ],
      ]',
      width: 60,
      nooutput: true,
    ],
  ],
]