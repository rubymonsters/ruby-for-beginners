# Operators

We've already used some arithmetic operators (`+` and `*`) above. You have
also learned that operators, under the hood, are just methods. Ruby just
adds a little bit of syntax sugar on top of these methods, so they're sweeter
to read, and write.

There also are operators for comparing things, for logical calculations, and
other operations. Let talk about some of them more.

#### Arithmetical operators

For numbers, the operators `+` and `*` obviously mean the mathematical
operations of adding and multiplying two numbers. However, these methods
are also defined on other objects, like strings and arrays.

Try it yourself in IRB:

```ruby
$ irb
> "<3" + "!"
=> "<3!"

> "<3" * 3
=> "<3<3<3"
```

As you can see, these operators mean something different for strings. But they
also make sense, don't they?

Adding one string to another just means that they will be concatenated into one
longer string. And multiplying a string by a number means repeating it as many
times.

The same works for arrays:

```ruby
$ irb
> [1, 2] + [3, 4]
=> [1, 2, 3, 4]

> [1, 2] * 3
=> [1, 2, 1, 2, 1, 2]
```

Again, adding two arrays means combining them into one big array. And
multiplying an array with a number means getting a big array with the original
elements repeated.


#### Logical operators

Logical operators are also, maybe more commonly, called boolean operators.

The term "boolean" originates from the book "The Mathemetical Analysis of
Logic" written by George Boole in 1847. Boolean logic has been fundamental in
the development of computers, and programming, since at their core, computers
are all about processing whether or not there is current flow: on vs off
(true vs false).

If you are curious, feel encouraged to google and read up on this online, but
for now, here, we can simply look at the 3 fundamental boolean operators and
what they do: `and`, `or`, and `not`.

The operator `and` returns `true` if, and only if, both values also are `true`.
So, only the expression `true and true` is also `true`. All of the expressions
`true and false`, `false and true`, `false and false` evaluate to `false`.

If you think about this, and come up with English sentences, then this will
make a lot of sense. "At the restaurant I'll have a tomato soup IF it is vegan
AND they still have some."

The operator `or` on the other hand returns `true` if at least one of the
values is `true`. So, only if both values are `false`, the operator returns
`false`.

That's why it is logically correct to answer the question "Would you like tea
or coffee for breakfeast?" with "Yes, please." IF you'd like either tea, or
coffee, or both. You'd only say "Hell, no!" if you'd like an orange juice
instead.

The operator `not` simply returns the negated, opposite value. `not true`
returns `false`, and `not false` returns `true`. Therefor, the following
statements are the same:

```ruby
puts "Always true" if not false
puts "Always true" unless false
```

Each of these three operators comes in two versions:

* `and` and `&&`
* `or` and `||`
* `not` and `!`

The difference between them has to do with what is called "operator precedence".

From math you know that in `1 + 2 * 3` evaluates to `7`, not `9`. This is
because the multiplication `*` operator binds stronger, and precedes the
addition operator `+`. In other words `1 + 2 * 3` is same as `1 + (2 * 3)`, and
not the same as `(1 + 2) * 3`.

In Ruby, the operators `&&`, `||`, and `!` bind stronger than, and thus precede
their fellows `and`, `or`, and `not`.


#### Comparison operators

In order to compare things Ruby has a bunch of comparison operators.

The operator `==` returns true if both objects can be considered the same. For
example `1 == 1 * 1` will return `true`, because the numbers on both sides
represent the same value. The expression `"A" == "A"` also returns `true`
because both strings have the same value.

Likewise, two arrays are considered the same when they contain the same
elements, in the same order. For example `[1, 2] == [1, 2]` will return `true`,
but `[1, 2] == [2, 3]` and `[1, 2] == [2, 1]` both will return `false`.

Note that we say "considered the same" because technically the two objects do
not have to be (and most often, as in our examples) are not the same objects.
E.g. while evaluating the expression `"A" == "A"` Ruby will actually create two
different string objects which both contain a single character `A`.

(In praxis this is almost always what you want. For the rare case when you
actually need to check if two objects are the same object there's the method
`equal?`: `"A".equal?("A")` would return `false`.)

Other comparison operators are: lesser `<` , lesser or equal `<=`, greater `>`,
and greater or equal `>=`. They also work on numbers and strings, in the way
you'll expect it. Open IRB and try a few combinations on numbers and strings.

Comparison operators most often are used in order to formulate conditions
in `if` statements. Like so:

```ruby
number = 20
puts "#{number} is greater than 10." if number > 10
```
