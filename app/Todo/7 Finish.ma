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
      "Final app",
    ],
    "You may have noticed on the last example that adding a new task resets the
    ‘done’ state of all the existing tasks. This is because that state is held
    inside the transformer, so is reset every time the list of tasks changes and
    the transformer runs.",
    "To fix this, we need to move the ‘done’ state out of the transformer and
    onto the tasks themselves. See the final code of our app below, noting the
    changes where the initial tasks are set up, where a new task is added, and
    where the tasks are transformed into clickable elements.",
    "We can also improve the readability of our code by using double commas to
    create blank lines in the layout.",
    @Example
    .[
      '{
      tasks:~ [
        [text: Task 1, done:~ ],
        [text: Task 2, done:~ ],
        [text: Task 3, done:~ ]
      ],
      new:~ ,,
      [
        [: h1, Todos],,
        [
          : input,
          placeholder: \'Enter new item...\',
          value: @new,,
          keys:~ ,
          @keys.Enter = down | [[text: @new, done:~ ], : @tasks] -> @tasks,
          @keys.Enter = down | \'\' -> @new,,
          focus:~ ,
          style: [padding: 10px, background: (@focus, orange, => gold)],
          ],,
          @tasks
          .[task=>>
            [
              mouse:~ ,
              @mouse.left = down | ! @task.done -> @task.done,,
              style:
                [
                  cursor: pointer,
                  background: (@mouse, lightblue),
                  \'text-decoration\': (@task.done, \'line-through\'),
                ],,
              @task.text,
            ],
          ],
        ]
      }',
      nooutput: wide,
    ],
  ],
]