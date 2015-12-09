# Logical operators

Logical operators are also, maybe more commonly, called boolean operators.

The term "boolean" originates from the book "The Mathemetical Analysis of
Logic" written by George Boole in 1847. Boolean logic has been fundamental in
the development of computers, and programming, since at their core, computers
are all about processing whether or not there is current flow: on vs off
(true vs false).

If you are curious, feel encouraged to google and read up on this online, but
for now, we can simply look at the 3 fundamental boolean operators and
what they do: `and`, `or`, and `not`.

The operator `and` returns `true` if, and only if, both values also are `true`.
So, only the expression `true and true` is also `true`. All of the expressions
`true and false`, `false and true`, `false and false` evaluate to `false`.

If you think about this, and come up with English sentences, then this will
make a lot of sense: *At the restaurant I'll have a tomato soup IF it is vegan
AND they still have some.*

The operator `or` on the other hand returns `true` if at least one of the
values is `true`. So, only if both values are `false`, the operator returns
`false`.

That's why it is logically correct to answer the question *Would you like tea
or coffee for breakfeast?* with *Yes, please.* IF you'd like either tea, or
coffee, or both. You'd only say *Hell, no!* if you'd like an orange juice
instead :)

The operator `not` simply returns the negated, opposite value. `not true`
returns `false`, and `not false` returns `true`. Therefor, the following
lines of code are the same:

```ruby
puts "Always true" if not false
puts "Always true" unless false
```

Each of these three operators comes in two versions:

* `and` and `&&`
* `or` and `||`
* `not` and `!`

The difference between them has to do with what is called "operator precedence".

From math you know that `1 + 2 * 3` evaluates to `7`, not `9`. This is
because the multiplication `*` operator binds stronger, and precedes the
addition operator `+`. In other words `1 + 2 * 3` is same as `1 + (2 * 3)`, and
not the same as `(1 + 2) * 3`.

In Ruby, the operators `&&`, `||`, and `!` bind stronger than, and thus precede
their fellows `and`, `or`, and `not`.
