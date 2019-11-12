[
  gap: 40,
  [style: 40 bold, color: colors?.red, Assignment],
  [
    gap: 25,,

    'Like combining, the assignment operator ‘:’ has different behaviour
    depending on the types of its arguments.',,

    [style: 18 bold, Single assignment],
    'If at least one argument is a value, then a single assignment will take
    place.',
    code?.["[a: 1, b: 2, c: 3]", "[x: [1, 2, 3]]", "[[a, b]: 10]", "[: label]"],
    ,

    'There are two assignment shorthand syntaxes, for assigning a key to its own
    value, or its own current value from the context.',
    code?.["[item:=]", "[x: 1, y: [x:=?]]"],,

    [style: 18 bold, Multi assignment],
    'If both arguments are lists, then multiple assignments will take place. The
    values in each list are paired together (by matching keys), and each pair
    performs an individual assignment.',
    code?.["[[a, b, c]: [1, 2, 3]]", "[[x: a, y: b]: [x: 1, y: 2]]"],,

    'Only values with a matching key are unpacked. To skip indices, an
    underscore (i.e. space) can be used as a placeholder, as long as it doesn’t
    matter that a value will be assigned to the ‘space’ key.',
    code?.["[[a, b]: [1, 2, 3]]", "[[_, _, a]: [1, 2, 3]]"],,

    [style: 18 bold, Unpacking],
    'With multi assignment, if the new keys are the same as the original ones,
    then the list values are effectively ‘unpacked’ into the containing list.
    Doing this can be simplified using shorthand syntax.',
    code?
    .["[[a: a, b: b]: [a: 1, b: 2, c: 3]]", "[[a:=, b:=]: [a: 1, b: 2, c: 3]]"],
    ,

    'Also, to unpack a whole list, simply leave the key blank. Existing values
    are overridden, apart from indexed values, where unpacked values are shifted
    to follow any existing ones.',
    code?
    .["[x: 10, :[x: a, y: b]]", "[1, 2, : [3, 4]]", "[x: 1, : [y: 2, z: 3]]"],,

    [style: 18 bold, Nesting \& recursion],
    'With multi assignment, every matched pair performs an assignment exactly as
    if it were done directly, again with all the possible options listed here.
    For example, if a matched pair are both lists, then another multi assignment
    will take place.',
    code?.["[[a, [b, c]]: [1, [2, 3]]]"],,

    [style: 18 bold, Default unpacking],
    'With multi assignment, if any values are unmatched, and the key list has a
    default, then all unpaired values are unpacked onto a new list on that key.
    This always does a single assignment, even when the default value is a
    list.',
    code?.["[[a, => b]: [1, 2, 3]]", "[[a, => [b, c]]: [1, 2, 3]]"],
    'Note that this gives us a way to assign a list value to a list key, i.e.
    without doing a multi assignment.',
    code?.["[[=> [x, y]]: [a, b]]"],
  ],
]