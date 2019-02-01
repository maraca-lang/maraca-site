[
  gap: 40,
  [style: 40 bold, color: colors?.red, Values],
  [
    gap: 25,,

    "Maraca is a text based language, where all values are strings of characters. There are various ways to create these values.",,

    [style: 18 bold, Alphanumeric and decimals],
    "Alphanumeric words (only from a-z, A-Z and 0-9) and decimals can be written directly.",
    code?.[Hello, 20, a1, 12.34],,

    [style: 18 bold, Special characters],
    "Single non-alphanumeric characters can be entered by prefixing with a single quote.",
    code?.["'@", "'£5"],
    "In addition, an underscore is equivalent to a single space.",
    code?.['_],,

    [style: 18 bold, Quoted values],
    "Longer complex strings can be created with double quotes, allowing non-alphanumeric characters and extra spaces.",
    code?.["""Let's go!""", """Hello   123"""],,

    [style: 18 bold, Nil],
    "The empty value is called 'nil' and has special behaviour in various situations. It can be written as an empty quoted string, although is rarely used directly in this way.",
    code?.[""""""],
  ],
]