# Operators are methods

As you can see a number has methods named like the arithmetic operators `+`,
`-`, `*`, and `/`. That's right! Interesting.

If you think about this, it makes sense: If everything is an object then
numbers are objects. If "doing things" means operating with methods by the way
of calling them, then what would `+` be? A method of course.

But if we call methods on objects using that dot `.` notation, then were are
the dots in `2 + 3 * 4`?

The trick is: Ruby adds them for you, silently. If you write the following code:

```ruby
number = 2 + 3 * 4
```

Then Ruby will translate this to the following:

```ruby
number = 2.+(3.*(4))
```

Fun, isn't it? These operators (as well as a lot of other operators, as you can
see in IRB) are all methods on numbers, and they can be called just like any
other method. The code above is valid Ruby code, and both lines do exactly the
same.

Ruby just adds a little bit of sytax in order to make it easier to read and
write for us. This is something called "syntax sugar" (no kidding), because it
makes the language more sweet.

Btw, the same is true for other things. For example, for the array and hash
syntax that uses square brackets `[]` for reading and writing:

```ruby
array = [1, 2, 3]
array[3] = 4
puts array[3]

hash = { :one => 'eins', :two => 'zwei' }
hash[:three] = 'drei'
puts hash[:three]
```

Translates to these method calls:

```ruby
array = [1, 2, 3]
array.[]=(3, 4)
puts(array.[](3))

hash = { :one => 'eins', :two => 'zwei' }
hash.[]=(:three, 'drei')
puts(hash.[](:three))
```

Knowing this can be useful when you want to write classes that look and feel
similar to arrays or hashes, but behave different.
