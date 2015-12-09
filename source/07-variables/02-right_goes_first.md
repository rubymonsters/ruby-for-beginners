# Things on the right go first

One last thing that is worth mentioning about variables:

Just as in traffic (well, at least in
[most parts of the world](https://en.wikipedia.org/wiki/Right-_and_left-hand_traffic)),
things on the right side go first :)

For a variable assignment, in order to assign the thing on the right side to
the name on the left side, Ruby first needs to figure out the thing on the
right. As you will see later the same is true for many other expressions in
Ruby.

In our example above it will first create the object that is the number `1`,
and then assign it to the name `number`. The following example makes that more
clear:

```ruby
number = 2 + 3 * 4
puts number
```

When Ruby looks at the first line `number = 2 + 3 * 4` it notices that this is
using the assignment operator `=`. Therefor, before it can assign the name
`number` to the "thing" (object) on the right ... it first needs to know what
that thing is.

So, before she does anything else, Ruby will first look at the expression `2 +
3 * 4`, which will result in the number (object) `14`. She will *then* assign
the name `number` to this object (i.e. evaluate the assignment operator `=`).

You can imagine that in this moment, when Ruby starts evaluating the assignment
`=` the code temporarily looks like this: `number = 14` (because the
calculation has returned the number `14`).

Does this make sense?

Again, on the second line Ruby will then pass the thing with the name `number`
(which is `14`) to `puts`, which will output it to the screen.

<p class="hint">
Ruby evaluates the expression on the right first.
</p>
