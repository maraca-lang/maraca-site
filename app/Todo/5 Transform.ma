@Util
.Stack
.[
  15px,
  [
    [
      style:
        [
          'font-size': 30px,
          color: @Util.Colors.red.@parseColor,
          'font-weight': bold,
        ],
      "Transforming blocks",
    ],
    "So far, we’ve only added the ‘done’ state to the first task. We could do
    the same for Task 2 and Task 3 by copying and pasting our code from Task 1
    and changing the text, but this isn’t very scalable.",
    [
      "Instead, we can use a ‘transformer’, which takes a block, and creates a
      new one by transforming each of its values. We write a transformer using
      <: @Util.Format.['=>>', keyword]/>, along with a key which lets us access
      the values from the original block.",
    ],
    @Example.['[1, 2, 3].[value=>> @value + 10]', width: 50],
    "Using this, we can take our list of tasks, and transform each one into a
    clickable item, expressed exactly as we did for Task 1 above. While we’re at
    it, let’s improve the user experience by adding a pointer cursor to the
    tasks, and also highlighting them when hovered.",
    "Try clicking any task and see them each update.",
    @Example
    .[
      [
        '[
          ...,
          [Task 1, Task 2, Task 3]
          .[task=>>
            (
              done:~,
              [
                mouse:~ ,
                @mouse.left = down | ! @done -> @done,
                style:
                  [
                    cursor: pointer,
                    background: (@mouse, lightblue),
                    \'text-decoration\': (@done, \'line-through\'),
                  ],
                @task,
              ]
            ),
          ],
        ]',
        '[
          [: h1, Todos],
          [
            : input,
            placeholder: \'Enter new task...\',
            focus:~ ,
            style: [padding: 10px, background: (@focus, orange, => gold)],
          ],
          [Task 1, Task 2, Task 3]
          .[task=>>
            (
              done:~,
              [
                mouse:~ ,
                @mouse.left = down | ! @done -> @done,
                style:
                  [
                    cursor: pointer,
                    background: (@mouse, lightblue),
                    \'text-decoration\': (@done, \'line-through\'),
                  ],
                @task,
              ]
            ),
          ],
        ]',
      ],
      render: true,
      width: 70,
    ],
  ],
]