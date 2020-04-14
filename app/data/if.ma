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
      "If / then / else",
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "For general terms (not just true / nil), round blocks return their last
        term, but only if <: span, style: ['font-weight': bold], all/> terms are
        non-nil:",
      ],
      example?.['(a, b, c)', '(1 = 2, hello, 3 < 4)'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "Use this to write ‘if A then B’, as the second term will be returned
        only when the first term is true (non-nil):",
      ],
      example?.['(First name? = John, Hello)', '(First name? = Sarah, Hello)'],
    ],
    [
      [
        style: ['padding-bottom': 10px],
        "A default value, returned if any term is nil, can be used to write ‘if
        A then B else C’:",
      ],
      example?
      .[
        '(Age? < 20, Hi, => Hello)',
        '(
          env? = dev,
          \'http://localhost:3000\',
          => \'http://www.server.com\',
        )',
      ],
    ],
  ],
]