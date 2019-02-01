[
  gap: 40,
  [style: 40 bold, color: colors?.red, Data],
  [
    gap: 25,,

    "In Maraca, higher-level operations such as sorting, filtering and slicing data are achived through common patterns built from the core syntax.",,

    [style: 18 bold, Index],
    "To turn a keyed list into an indexed one while maintaining the sort order, map through it and unpack each item onto the next available index.",
    code?
      .[
        "[
          x: a,
          y: b,
          z: c,
        ]
          .[v=>> :: [v?]]",
      ],,

    [style: 18 bold, Sort],
    "First re-key the items, and then index them.",
    code?
      .[
        "[
          [name: Jane],
          [name: Steve],
          [name: Anna],
        ]
          .[v=>> v?.name: v?]
          .[v=>> :: [v?]]",
      ],,

    [style: 18 bold, Filter],
    "First do an AND operator on each item, and then index them.",
    code?
      .[
        "[
          [name: Jane],
          [name: Steve],
          [name: Anna],
        ]
          .[v=>> (v?.name ! Steve, v?)]
          .[v=>> :: [v?]]",
      ],,

    [style: 18 bold, Slice],
    "Filter as above, but using the keys rather than the values.",
    code?
      .[
        "[
          [name: Jane],
          [name: Steve],
          [name: Anna],
        ]
          .[i=> v=> (i? >= 2, v?)]
          .[v=>> :: [v?]]",
      ],
  ],
]