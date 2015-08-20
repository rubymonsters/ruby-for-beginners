# Operators are methods

As you have seen a number has methods named like the arithmetic operators `+`,
`-`, `*`, and `/`. That's right! Interesting.

If you think about this, it makes sense: If everything is an object then
numbers are objects. If "doing things" means operating with methods by the way
of calling them, then what would `+` be? A method of course.

But if we call methods on objects using that dot `.` notation, then where are
the dots in `2 + 3 * 4`?

The trick is: Ruby adds them for you, silently. If you write the following code:

```ruby
number = 2 + 3 * 4
```

Then Ruby will translate this to the following:

```ruby
number = 2.+(3.*(4))
```

Fun, isn't it? These operators are all methods on numbers, and they can be
called just like any other method. (The same is true for lots of other
operators, as you can see in IRB, when you run `1.methods.sort`.) The code
above is valid Ruby code, and both lines do exactly the same.

Ruby just adds a little bit of syntax in order to make it easier to read and
write for us: It allows us to write `number = 2 + 3 * 4` instead of `number =
2.+(3.*(4))`, which is a pretty nasty thing to type.

This is something called "syntax sugar", because it makes the language more
sweet (no kidding).

By the way, this works the same way for other things too.

For example, you have learned about the array and hash syntax that uses square
brackets `[]` for reading and writing.

Ruby translates this code:

```ruby
array = [1, 2, 3]
array[3] = 4
puts array[3]

hash = { :one => 'eins', :two => 'zwei' }
hash[:three] = 'drei'
puts hash[:three]
```

to these method calls:

```ruby
array = [1, 2, 3]
array.[]=(3, 4)
puts(array.[](3))

hash = { :one => 'eins', :two => 'zwei' }
hash.[]=(:three, 'drei')
puts(hash.[](:three))
```

Knowing this can be useful when you want to write classes that look and feel
similar to arrays or hashes, but behave differently.
