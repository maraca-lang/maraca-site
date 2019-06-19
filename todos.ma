{
  allTodos: [[done: , text: A], [done: , text: B], [done: , text: C]],
  filtered:
    [
      All: allTodos?,
      Active: allTodos?.[v=>> :: [(!v?.done, v?)]],
      Completed: allTodos?.[v=>> :: [(v?.done, v?)]],
    ],
  filter: All,
  todos: filtered?.filter?,
  new: ,
  [
    style: 20,
    color: 0 0 30,
    pad: 50,
    gap: 25,
    [style: 40 bold, Todos],
    [
      fill: 0 0 30,
      pad: 1,
      [
        input: new?,
        fill: 0 0 95,
        pad: 10,
        enter? | (new?, [[done: , text: new?], :: allTodos?], => allTodos?)
          ->
          allTodos?,
        enter? | "" -> new?,
      ],
    ],
    (
      #(todos?) > 0,
      [
        pad: 0 1 1 1,
        fill: 0 0 30,
        [
          gap: 10,
          todos?
            .[
              v=> i=>
                [
                  pad: 1 0 0 0,
                  fill: 0 0 30,
                  [
                    hover: ,
                    cols: all,
                    fill: 0 0 (hover?, 80, => 95),
                    [
                      x: 40,
                      pad: 10,
                      [fill: 0 0 (v?.done, 30, => (hover?, 80, => 95))],
                      click? | !v?.done -> v?.done,
                    ],
                    [
                      pad: 5,
                      style: (v?.done, strike),
                      color: 0 0 (v?.done, 60, => 0),
                      y: middle,
                      v?.text,
                      click? | !v?.done -> v?.done,
                    ],
                    {
                      hovered: hover?,
                      [
                        hover: ,
                        fill: 0 0 (hover?, 60, => (hovered?, 80, => 95)),
                        x: 40,
                        y: middle,
                        style: 30 center,
                        pad: 5,
                        click? | allTodos?.[w=>> (w? ! v?, w?)] -> allTodos?,
                        '×,
                      ],
                    },
                  ],
                ],
            ],
        ],
      ],
    ),
    [
      style: 16,
      color: 0 0 70,
      fill: 0 0 30,
      pad: 1,
      [
        cols: all,
        fill: 0 0 95,
        [
          pad: 10,
          {
            num: #(filtered?.Active),
            (num? == 1, 1 item left, => {num?} items left),
          },
        ],
        [
          x: right,
          y: middle,
          pad: 0 0 0 5,
          cols: all,
          gap: 20,
          ::
            [All, Active, Completed]
              .[
                v=>>
                  [
                    x: 100,
                    style: center,
                    color: 0 0 (filter? == v?, 30, => 70),
                    fill: 0 0 (filter? == v?, 30, => 90),
                    pad: 1,
                    [pad: 4, fill: 0 0 90, v?],
                    click? | v? -> filter?,
                  ],
              ],
        ],
      ],
    ],
  ],
}