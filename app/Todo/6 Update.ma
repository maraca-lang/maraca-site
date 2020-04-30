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
      "Updating blocks",
    ],
    "Now we’re ready to use our input to add new tasks. First, we’ll turn our
    list of tasks into a changeable hidden value, so we can access and update it
    from other parts of our code.",
    Example?
    .[
      [
        '{
          tasks:~ [Task 1, Task 2, Task 3],
          [
            ...,
            tasks?
            .[
              task=>>
                ...,
            ],
          ],
        }',
        '{
          tasks: [Task 1, Task 2, Task 3],
          [
            [: h1, Todos],
            [
              : input,
              placeholder: \'Enter new task...\',
              focus:~ ,
              style: [padding: 10px, background: (focus?, orange, => gold)],
            ],
            tasks?
            .[task=>>
              {
                done:~,
                [
                  mouse:~ ,
                  mouse?.left = down | ! done? -> done?,
                  style:
                    [
                      cursor: pointer,
                      background: (mouse?, lightblue),
                      \'text-decoration\': (done?, \'line-through\'),
                    ],
                  task?,
                ]
              },
            ],
          ]
        }',
      ],
      render: true,
      width: 70,
    ],
    "With that in place, we can combine what we’ve learnt so far to create a
    hidden value for the new task, attach it to the value property of the input
    element, watch the keys property for the enter key to be pressed, and when
    it is add the new task and clear the input.",
    [
      "To create the updated list of tasks, we create a new block, add the newly
      typed value from the input, and then copy in all the existing tasks, using
      <: Util?.Format.[\:, keyword]/> without a key, which has this behaviour if
      the assigned value is a block. (A text value can’t be copied in this way,
      and as we’ve seen already is just assigned to the blank key.)",
    ],
    "Try entering a new task and hitting enter.",
    Example?
    .[
      [
        '{
        tasks:~ [Task 1, Task 2, Task 3],
        new:~ ,
        [
          ...,
          [
            : input,
            placeholder: \'Enter new item...\',
            value: new?,
            keys:~ ,
            keys?.Enter = down | [new?, : tasks?] -> tasks?,
            keys?.Enter = down | \'\' -> new?,
              ...,
            ],
            ...,
          ],
        }',
        '{
        tasks:~ [Task 1, Task 2, Task 3],
        new:~ ,
        [
          [: h1, Todos],
          [
            : input,
            placeholder: \'Enter new item...\',
            value: new?,
            keys:~ ,
            keys?.Enter = down | [new?, : tasks?] -> tasks?,
            keys?.Enter = down | \'\' -> new?,
            focus:~ ,
            style: [padding: 10px, background: (focus?, orange, => gold)],
            ],
            tasks?
            .[task=>>
              {
                done:~,
                [
                  mouse:~ ,
                  mouse?.left = down | ! done? -> done?,
                  style:
                    [
                      cursor: pointer,
                      background: (mouse?, lightblue),
                      \'text-decoration\': (done?, \'line-through\'),
                    ],
                  task?,
                ]
              },
            ],
          ]
        }',
      ],
      render: true,
      width: 70,
    ],
  ],
]