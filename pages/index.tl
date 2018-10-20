[
  [class: container,

    [:h1, Maraca],
    [:p, "Intuitive & powerful data language, from simple formulae to advanced custom interfaces."],

    [:h2, Basic syntax],

    [:h3, Values],
    [class: cols group,
      [[:ul, [:li, "Words made of letters and numbers"]]],
      [[class: code group,
        [:pre, "
          Hello
          a1
          X Y Z
          option 5
          First name
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Decimal numbers"]]],
      [[class: code group,
        [:pre, "
          12.34
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Negative values"]]],
      [[class: code group,
        [:pre, "
          -1
          -Hello
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Extra spaces are removed"]]],
      [[class: code group,
        [:pre, "
          Hello   123
        "],
        [:pre, "
          Hello 123
        "],
      ]],
    ],

    [:h3, Quote values],
    [class: cols group,
      [[:ul, [:li, "Characters other than letters or numbers"]]],
      [[class: code group,
        [:pre, "
          \"£5\"
          \"Let's go!\"
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Extra spaces"]]],
      [[class: code group,
        [:pre, "
          \"Hello   123\"
        "],
      ]],
    ],

    [:h3, Data values],
    [class: cols group,
      [[:ul, [:li, "Dates"]]],
      [[class: code group,
        [:pre, "
          @now
          @tomorrow
          @\"10/05/80\"
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Locations (in progress)"]]],
      [[class: code group,
        [:pre, "
          @@here
          @@london
        "],
      ]],
    ],

    [:h3, Arithmetic],
    [class: cols group,
      [[:ul, [:li, "Addition, subtraction, multiplication, division"]]],
      [[class: code group,
        [:pre, "
          1 + 2
          5 - 1
          3 * 4
          6 / 3
        "],
        [:pre, "
          3
          4
          12
          2
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Powers"]]],
      [[class: code group,
        [:pre, "
          2 ^ 3
        "],
        [:pre, "
          8
        "],
      ]],
    ],

    [:h3, "True / False"],
    [class: cols group,
      [[:ul, [:li, "Equal"]]],
      [[class: code group,
        [:pre, "
          2 = 6
        "],
        [:pre, "
          false
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Less than (or equal), greater than (or equal)"]]],
      [[class: code group,
        [:pre, "
          5 < 3
          5 <= 5
          8 > 2
          1 >= 3
        "],
        [:pre, "
          false
          true
          true
          false
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Not"]]],
      [[class: code group,
        [:pre, "
          8 ! 2
          ! 3 < 5
        "],
        [:pre, "
          true
          false
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "And: (all items true)"]]],
      [[class: code group,
        [:pre, "
          (1 = 2, 3 < 4, 5 = 5)
        "],
        [:pre, "
          (false, true, true) => false
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Or: {any item true}"]]],
      [[class: code group,
        [:pre, "
          {1 = 2, 3 < 4, 5 = 5}
        "],
        [:pre, "
          {false, true, true} => true
        "],
      ]],
    ],

    [:h3, Variables],
    [class: cols group,
      [[:ul, [:li, "Access variables with '?'"]]],
      [:p]
    ],
    [class: cols group,
      [[:ul, [:li, "In # filter use for row number"]]],
      [[class: code group,
        [:pre, "
          ?
        "],
        [:pre, "
          10
        "],
      ]],
    ],
    [class: cols group,
      [[:ul, [:li, "Everywhere else use with field names"]]],
      [[class: code group,
        [:pre, "
          First name?
        "],
        [:pre, "
          Hannah
        "],
      ]],
    ],

    [:h3, Sorting],
    [class: cols group,
      [[:ul, [:li, "Sort by multiple values"]]],
      [[class: code group,
        [:pre, "
          Last name? | First name?
        "],
      ]],
    ],

    [:h1, "Try it out!"],
    [style: [background: "#f9f9f9", padding: 15px 20px, borderRadius: 3px],
      {
        fields: [First name, Last name, DOB, Score 1, Score 2],
        filter: * & "DOB? < @15 years ago",
        sort: * & "Last name? | -DOB?",
        limit: * & "5 < ?, ? <= 10",
        formula: * & "(Score 1? + Score 2?) / 2",

        [
          [:table,
            [:thead,
              [:tr,
                [:th, "Filter:", style: [width: 100px]],
                [:th,
                  [:input,
                    placeholder: "Enter filter",
                    value: filter?,
                  ],
                ],
              ],
              [:tr,
                [:th, "Sort:"],
                [:th,
                  [:input,
                    placeholder: "Enter sort",
                    value: sort?,
                  ],
                ],
              ],
              [:tr,
                [:th, "# Filter:"],
                [:th,
                  [:input,
                    placeholder: "Enter # filter",
                    value: limit?,
                  ],
                ],
              ],
            ],
          ],
          [:table, class: table,
            [:thead,
              [:tr,
                [:th, style: [width: 50px], "#"],
                ...
                fields?
                [f=>> [:th, f?]],
                [:th, style: [width: 280px],
                  [:input,
                    placeholder: Enter formula,
                    value: formula?,
                  ],
                ],
              ]
            ],
            [:tbody,
              ...
              data?
              [v=>> ({{ filter? [:1, x=> "(" .. x? .. ")"], v? }}, v?)]
              [k=> v=> {{ sort?, v? }} | k?: v?]
              [v=>> :: v?]
              [k=> v=> [index: k?, ...v?]]
              [k=> v=> ({{ limit? [:1, x=> "(" .. x? .. ")"], k? }}, v?)]
              [v=>> :: v?]
              [k=> v=>
                [:tr,
                  [:th, v? index],
                  ...
                  fields?
                  [f=>> [:td, f? [DOB: #date f? (v?), => f? (v?)]]],
                  [:td, {{ formula?, v? }}],
                ]
              ]
            ]
          ]
        ]
      }
    ]

  ],
]