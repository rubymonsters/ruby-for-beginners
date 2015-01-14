# Arithmetical operators

For numbers, the operators `+` and `*` obviously mean the mathematical
operations of adding and multiplying two numbers. Of course there are other
arithmetical operators. Here's a full list:

* `+` - addition
* `-` - subtraction
* `*` - multiplication
* `/` - division
* `**` - exponentiation
* `%` - modulus (the rest of a division, e.g. `5 % 2` returns `1`)

However, some of these methods are also defined on other objects, like strings
and arrays.

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
