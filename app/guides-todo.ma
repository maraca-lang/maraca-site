[
  gap: 40,
  [style: 40 bold, color: colors?.red, Todo App],
  [
    gap: 25,,

    'In this guide we’ll run through making a very simple todo app.',,

    'To start, lets create a braces semilist to allow us to store our todos, and
    return a component which renders the title of our app and the list of our
    todos, using the gap property to add spacing and make them render in a
    stack.',
    'Note that we unpack the list of todos into the component to make them
    siblings to the title.',
    code3?
    ."{
      todos: [Item 1, Item 2, Item 3],
      [
        gap: 10,
        pad: 20,
        [style: bold, Todos App],
        ~: todos?,
      ],
    }",,

    'Next, lets add an input for entering a new todo, and a stream to store the
    value as we type. We’ll give the input a background color and some padding
    to make it visible.',
    'For the background, we use a color with a high luminance to make sure it’s
    light.',
    code3?
    ."{
      todos: [Item 1, Item 2, Item 3],
      new: ,
      [
        gap: 10,
        pad: 20,
        [style: bold, Todos App],
        [
          input: new?,
          fill: 290 80 95,
          pad: 10,
        ],
        ~: todos?,
      ],
    }",,

    'Now we can use the ‘enter’ stream of the input to trigger updates when we
    hit enter. We’ll add two triggers, one to add the new todo to our todos
    list, and one to clear the input.',
    'Try it out by typing something in the input box below and hitting enter.',
    'Also, lets add bullet points to our todos by applying a map to the list,
    creating a component per todo item.',
    code3?
    ."{
      todos: [Item 1, Item 2, Item 3],
      new: ,
      [
        gap: 10,
        pad: 20,
        [style: bold, Todos App],
        [
          input: new?,
          fill: 290 80 95,
          pad: 10,
          enter? | [new?, ~: todos?]
            ->
            todos?,
          enter? | \"\" -> new?,
        ],
        ~: todos?.[t=>> [style: bullet, t?]],
      ],
    }",,

    'Finally, lets convert each todo into a list, so we can also store a ‘done’
    flag for each. We can then add a click trigger to our todos to toggle this
    flag, and use it to apply some conditional styling.',
    'The map from todos to components is quite complex now, so we’ll separate it
    out, using double commas to tell the code formatter to leave spaces.',
    code3?
    ."{
      todos:
        [
          [text: Item 1, done: ],
          [text: Item 2, done: ],
          [text: Item 3, done: ],
        ],
      new: ,
      next:
        [[text: new?, done: ], ~: todos?],,
      renderTodo:
        [
          t=>
            [
              style:
                bullet
                  (t?.done, strike italic),
              t?.text,
              click? | !t?.done -> t?.done,
            ],
        ],,
      [
        gap: 10,
        pad: 20,
        [style: bold, Todos App],
        [
          input: new?,
          fill: 290 80 95,
          pad: 10,
          enter? | next? -> todos?,
          enter? | \"\" -> new?,
        ],
        ~: todos?.[t=>> renderTodo?.t?],
      ],
    }",
  ],
]