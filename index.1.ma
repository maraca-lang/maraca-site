[
      [:h1, "Try it out!"],
      [
        style: [background: "#f9f9f9", padding: 15px 20px, borderRadius: 3px],
        {
          fields: [First name, Last name, DOB, Score 1, Score 2],
          filter: *,
          sort: *,
          limit: *,
          formula: * & "(Score 1? + Score 2?) / 2",
          data:
            data?
              [v=>> (##(filter? [:1, x=> "(".x?.")"]) v?, v?)]
              [k=> v=> [:: ##("[".sort?."]") v?, ##(filter?) v?, k?]: v?]
              [v=>> :: [v?]]
              [k=> v=> [index: k?, :: v?]]
              [k=> v=> (##(limit? [:1, x=> "(".x?.")"]) k?, v?)]
              [v=>> :: [v?]],
          [
            [
              :table,
              style: [marginBottom: 20px],
              [
                :thead,
                [
                  :tr,
                  [:th, "Only show if:", style: [width: 180px]],
                  [
                    :th,
                    [
                      :input,
                      placeholder: "Example: DOB? < @15 years ago",
                      value: filter?,
                    ],
                  ],
                ],
                [
                  :tr,
                  [:th, "Order rows by:"],
                  [
                    :th,
                    [:input, placeholder: "Example: Last name?", value: sort?],
                  ],
                ],
                [
                  :tr,
                  [:th, "Only show rows:"],
                  [
                    :th,
                    [:input, placeholder: "Example: ? <= 10", value: limit?],
                  ],
                ],
              ],
            ],
            [
              :table,
              class: table,
              [
                :thead,
                [
                  :tr,
                  [:th, style: [width: 50px], Row],
                  :: fields? [f=>> [:th, f?]],
                  [
                    :th,
                    style: [width: 280px],
                    [:input, placeholder: Enter formula, value: formula?],
                  ],
                ],
              ],
              [
                :tbody,
                ::
                  data?
                    [
                      k=> v=>
                        [
                          :tr,
                          [:th, v? index],
                          ::
                            fields?
                              [f=>> [:td, f? [DOB: #time f?.v?, => f?.v?]]],
                          [:td, ##(formula?) v?],
                        ],
                    ],
              ],
            ],
          ],
        },
      ],]