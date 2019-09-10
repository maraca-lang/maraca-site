[
  gap: 40,
  [style: 40 bold, color: colors?.red, Operators],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Arithmetic],
    "For arithmetic operations, Maraca converts values into their numeric value,
    before appling the operator and converting the result back to a string.",,

    [style: 18 bold, "Basic arithmetic"],
    code?.["1 + 2", "5 - 1", "3 * 4", "5 / 2"],,

    [style: 18 bold, Minus],
    "As well as the above 'a - b' form, minus can also operate on a single
    value, which doesn't have to be numeric (the negative of a text value is
    useful for sorting in reverse).",
    code?.["-20", "-Hello"],,

    [style: 18 bold, Powers],
    code?.["2 ^ 3"],,

    [style: 18 bold, Modulo],
    "The modulo operator calculates the remainder after division, except when
    there is no remainder in which case it returns the divisor (i.e. the result
    of x % 5 will be in the range 1-5, rather than 0-4).",
    code?.["8 % 3", "5 % 5"],,

    [style: 18 bold, "Non-numeric values return nil"],
    "If either value can't be converted to a number, nil is returned.",
    code?.["1 + hi"],
  ],
  [
    gap: 25,,

    [style: 26 bold, color: colors?.red, Comparisons],
    "Boolean operations in Maraca return either the string 'true' (for true), or
    nil (for false).",,

    [style: 18 bold, Loose equal],
    "Lower values mean more similar.",
    code?.["John = James", "John = Jon"],,

    [style: 18 bold, Strict equal],
    code?.["2 == 6", "3 == 3"],,

    [style: 18 bold, Comparisons],
    code?.["5 \< 3", "5 \<= 5", "8 \> 2", "1 \>= 3"],,

    [style: 18 bold, Not],
    code?.["8 ! 2", "! 3 \< 5"],
  ],
]
