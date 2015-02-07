# Comparison operators

In order to compare things Ruby has a bunch of comparison operators.

The operator `==` returns true if both objects can be considered the same. For
example `1 == 1 * 1` will return `true`, because the numbers on both sides
represent the same value. The expression `"A" == "A"` also returns `true`
because both strings have the same value.

Likewise, two arrays are equivalent when they contain the same elements, in the
same order. For example `[1, 2] == [1, 2]` will return `true`, but `[1, 2] ==
[2, 3]` and `[1, 2] == [2, 1]` both will return `false`.

Note that we say "considered the same" and "equivalent" because technically the
two objects do not have to be (and most often, as in our examples) are not the
same objects.  E.g. while evaluating the expression `"A" == "A"` Ruby will
actually create two different string objects which both contain a single
character `A`.

In practice this is almost always what you want. For the rare case when you
actually need to check if two objects are the same object there's the method
`equal?`. E.g., `"A".equal?("A")` returns `false`.

Other comparison operators are: less than `<` , less than or equal `<=`, greater than `>`,
and greater than or equal `>=`. They also work on numbers and strings, in the way
you'll expect it. Open IRB and try a few combinations on numbers and strings.

Comparison operators most often are used in order to formulate conditions
in `if` statements. Like so:

```ruby
number = 20
puts "#{number} is greater than 10." if number > 10
```

The most funny operator in Ruby is `<=>`, because it's called the spaceship
operator. No kidding :) It is rather rarely used, and it is useful for
implementing custom ways of sorting things.
