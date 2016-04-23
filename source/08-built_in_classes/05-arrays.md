# Arrays

*Arrays are like bags that contain things*

While numbers, Strings, `true`, `false`, and `nil` all represent simple,
primitive things, Arrays are more interesting, and very useful.

Arrays are things that store (or "hold") other things. You can think of an
Array as a collection or list of things. Or better yet, as a bag that you can
throw things in: *The bag itself is a thing (an object), too*.

<p class="hint">
An Array is an object that stores other objects.
</p>

An Array is created by separating values by commas, and enclosing this list
with square brackets, like so:

```ruby
[1, 2, 3]
```

This is a simple Array that holds three numbers.

<p class="hint">
An Array is created by listing objects, separated by commas, and enclosed by square brackets.
</p>

Arrays can contain all kinds of things:

```ruby
["A string", 1, true, :symbol, 2]
```

This creates an Array with 5 elements, i.e. a bag that contains 5 things: a
string, a number, `true`, a symbol, and another number.

<p class="hint">
Arrays can contain all kinds of objects.
</p>

Note that in Ruby Arrays always keep their order: Unlike a real bag, where,
when you throw in a bunch of apples, they might come out in a different order,
an Array always keeps its objects in the same defined order (unless you do
something to change the order).

Also note that in Ruby you can store any kind of object in an Array. For
example, you can also store Arrays in an Array: that's a 2-dimensional Array,
like a table that has many rows, and each row has many cells ("things").

<p class="hint">
Arrays have a defined order, and can store all kinds of objects.
</p>

## Retrieving an element from an Array

Arrays can be used in a lot of different, and useful ways, but the most basic
one is to retrieve a certain element by the way of referring to its position:
*Please get me the element at position 1!*

In Ruby, you can do this with square brackets like so:

```ruby
words = ["one", "two", "three"]
puts words[1]
```

Do you reckognize how we use a [variable](/variables.html) to assign a name
to our Array here?

`words[1]` means: from the Array `words` get the element at position
`1`. `puts` will then print this value out to the screen. (By the way`puts`
stands for "(out-) put string".)

So, as you can see square brackets `[]` mean different things when used in
different contexts. The same is true for other punctuation, too.

In our case here the square brackets on the first line are used to create an
Array object with the given elements. On the second line the square brackets
are now appended to a variable name. This means we want look up an element from
the Array that (at this moment) is called `words` (i.e. assigned to the
variable `words`).

<p class="hint">
Punctuation (such as square brackets) has different meanings in different contexts.
</p>

## Arrays are zero based

What do you think our example code will print out to the terminal? Funnily,
it's `two`, and not `one`. Huh?

The reason for this is: The first position in an Array is 0, not 1. So the
position 1 refers to the second element, not the first one.

In programming books and the Ruby documentation you'll often find the word
"index" to be used instead of "position" in this context.

<p class="hint">
Arrays start with the index 0, not 1.
</p>

## Appending an element to an Array

In order to add an element to the end of an existing Array you can use the
operator `<<`, called "shovel operator", like so:

```ruby
words = ["one", "two", "three"]
words << "four"
puts words[3]
```

This prints out `four`: The string `"four"` has been "shoveled" into, that
means, appended to the Array. And since it now sits at position `3` we can
access it using `words[3]`.

## Setting an element to a position

You can also set an element to a specific index, like so:

```ruby
words = ["one", "two", "three"]
words[3] = "four"
puts words[3]
```

This also prints out `four`.

You could also overwrite existing elements the same way. For example this
would set the word `"uno"` to the position `0` (i.e. overwrite `"one"`):

```ruby
words = ["one", "two", "three"]
words[0] = "uno"
puts words[0]
```

So, this would now output `uno`.

<p class="hint formatting">
On formatting: Note that there are no spaces inside the square brackets,
and there's one space after each comma.
</p>

## Missing elements

What if we try to retrieve an element that does not exist, for example
the element at the fourth, or fifth position (index)?

Right, we get back `nil`, meaning "nothing":

```ruby
> words = ["one", "two", "three"]
> words[3]
=> nil
> words[4]
=> nil
```

You'll learn later that every operation ("method") in Ruby always
[returns exactly one thing](/writing_methods/return_values.html)
(i.e. one object), and that's why there needs to be a "thing" that represents
"nothing".

This will start to feel pretty natural to you pretty soon.

## Nested Arrays

As said before, Arrays can contain all sorts of things. So, they can also
contain more Arrays.

This is quite a common thing to use when you need to represent some data that
has the characteristics of a table, like an spreadsheet.

The outer Array represents the table, and each inner Array represents one
row. Each value then represents a cell. For example:

```ruby
[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [0]
]
```

This is a nested Array that represents the structure of number keys on a phone.

## Things you can do with Arrays

Here are a few things you can do with Arrays.

Look at them, and play with them in `irb`. Don't necessarily try to memorize
all of them ... you can always look things up in the documentation when you
actually need these. It might be useful if you've seen some of them before
though.

Funnily, you can "calculate" with Arrays. Remember set theory from your math
classes? This is pretty similar.

You can add Arrays:

```ruby
$ irb
> [1, 2] + [3, 4]
=> [1, 2, 3, 4]
```

Subtract them from each other:

```ruby
$ irb
> [:one, :two, :three, :four] - [:three, :four]
=> [:one, :two]
```

Multiply with a number:

```ruby
$ irb
> ["Ruby", "Monstas"] * 3
=> ["Ruby", "Monstas", "Ruby", "Monstas", "Ruby", "Monstas"]
```

And find the intersection:

```ruby
$ irb
> [1, 2, 3] & [2, 3, 4]
=> [2, 3]
```

`first` and `last` are alternative ways to retrieve the first and last element:

```ruby
$ irb
> [1, 2, 3].first
1
> [1, 2, 3].last
3
```

Some other things that you can do with Arrays that you can try yourself in
`irb`:

```ruby
> [1, 2, 3].length
=> 3

> [3, 1, 2].sort
=> [1, 2, 3]

> [1, nil, 2, 3, nil].compact
=> [1, 2, 3]

> [1, 2, 3].index(3)
=> 2

> [1, 2, 3, 4].rotate(2)
=> [3, 4, 1, 2]

> [[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose
=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

In these examples `compact` removes all `nil` values from the Array.
`transpose` works with a nested Array and "flips" the table, i.e. turns columns
into rows, and rows into columns.

Exercises: Now would be a good time to do some of the [exercises on
Arrays](/exercises/arrays_1.html).
