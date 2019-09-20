[
  gap: 40,
  [style: 40 bold, color: colors?.red, Data Operations],
  [
    gap: 25,,

    'In Maraca, common data operations such as sorting, filtering and slicing
    data are achived through common patterns built from the core syntax.',
    'All the following examples use this data:',
    code?.["#data"],,

    [style: 18 bold, Index],
    'To turn a keyed list into an indexed one, map through it and unpack each
    item onto the next available index.',
    code?.["#data.[v=>> ~: [v?]]"],,

    [style: 18 bold, Sort],
    'First re-key the items, and then index them.',
    code?
      .[
        "#data
        .[v=>> v?.Name: v?]
        .[v=>> ~: [v?]]",
      ],,

    [style: 18 bold, Filter],
    'Do an AND operator on each item.',
    code?
      .[
        "#data
        .[v=>> (v?.Name ! Joe, v?)]",
      ],,

    [style: 18 bold, Slice],
    'First index, then filter as above but using the keys rather than the
    values, then index again.',
    code?
      .[
        "#data
        .[v=>> ~: [v?]]
        .[v=> k=> (k? >= 2, v?)]
        .[v=>> ~: [v?]]",
      ],
  ],
]