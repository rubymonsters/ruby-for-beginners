# Everything is an object

In Ruby everything is an object: Numbers are objects, strings, arrays and
hashes are objects. Even classes are objects.

Well, actually this is not completely true: not *everything* is an object, but
almost everything, and that's good enough to know for now.

#### Objects have classes

You can see this when you open IRB in your terminal and ask a string or array
for their class:

```ruby
$ irb
> "this is a string".class
=> String
> ["an", "arrray"].class
=> Array
```

That means that the sentence following sentence is true: In Ruby, "a string"
*is a* String.

Yeah, we knew that already. However, you can also ask the same question in Ruby:

```ruby
$ irb
> "this is a string".is_a?(String)
=> true
```

So, the actual string knows that it *is a* `String`, which in Ruby means that
it is an instance of the class `String`. You can do this for any object. E.g.
`1.is_a?(Numeric)` also returns `true`.

Even more interesting, you can also ask a class for its class:

```ruby
$ irb
> String.class
=> Class
```

There's a class named `Class`, and the class `String` *is a* `Class`.

While this knowledge might not be super useful in praxis most of the time, it
is kinda cool to see how in Ruby, where everything is an object, even classes
are objects, and have their own class.

So let's move on to more practical things.


#### Calling methods

Objects have methods, allowing us to do interesting stuff with them.

We used methods in the example above: `class` and `is_a?` are methods that we
called on the object `"this is a string"`.

In Ruby, methods are called on objects by using a dot, like so:


```ruby
object.method
```

If we need to pass arguments to the method we call, then we add parantheses,
and separate the arguments by comma:

```ruby
object.method(an_argument, another_argument)
```

If you are curious what methods are defined on a certain object, then you can
quickly pop into IRB and ask the object for its methods.

That's right, `methods` is a method defined on all objects. When you call it
then it will return an array of symbols, which are the method names. It makes
sense to sort this array, so it's easier to read:

```ruby
$ irb
> 1.methods.sort
=> [:*, :+, :-, :/, :between?, :even?, :odd?, :zero?]
```

If you do this, you'll see that the object `1` actually has a lot more method
names. We have stripped the array down a little, because we want to talk about
some of these methods.


#### Operators are methods

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

But there's another little fun secret here, that we have so far silently kept
to ourselves:

As mentioned before `=` also is an operator, called the "assignment operator".
And this operator also is a method!

So we could write the statement above as:

```ruby
number=(2.+(3.*(4)))
```

Of course this looks even more weird. And so Ruby again adds a little bit of
syntax sugar so we can just write

```ruby
number = 2 + 3 * 8
```

instead.

#### Predicate methods

In the method list above you can also see that in Ruby we can have methods
that end with a question mark `?`. This makes them read like a question, so
we can ask a number if it is even or odd:
numbers:

```ruby
$ irb
> 5.odd?
=> true

> 5.even?
=> false
```

Or you can ask the number if it's between two other numbers:

```ruby
> 5.between?(1, 10)
=> true

> 5.between?(11, 20)
=> false
```

Methods that end with a question mark return either `true` or `false`, and
they are called "predicate methods".

If you look at the methods that are defined on strings and arrays, then
you'll find a bunch of method names that look like they are doing exactly
what they describe.

For example, some of the things you can do with strings are:

* `"a string".capitalize` returns `A string`, with the first letter uppercased.
* `"a string".length` returns `8`, which is the length of the string.
* `"a string".start_with?("a")` returns `true`, because the string starts with an `"a"`.
* `"a string".include?("s")` returns `true`, because the string contains the character `"s"`.

Some examples for useful methods on arrays are:

* `[5, 1, 3].sort` returns another array, with the elements sorted: `[1, 3, 5]`.
* `[5, 1, 3].size` returns `3`, the number of elements in the array.
* `[1, 1, 1, 2].uniq` returns a new array with duplicate elements removed: `[1, 2]`.
* `[1, 2, 3].join(", ")` returns a string `"1, 2, 3"`.
* `[1, 2, 3].include?(2)` returns true because the array contains the number `2`.


#### Questions and commands

Generally speaking, methods play one of two roles. They either answer a question,
or they perform a command.

For example, if we have a `user` object, and users have a name, then we would
ask the user object for its name by calling the method `name`: `user.name`
would return the user's name. Arrays know their size (how many elements they
have), so we can ask an array: `[1, 2, 3].size` will return `3`.

Another example is the method `sort` on arrays. This method does not actually
sort the array that it is called on. Instead it returns a *new* array with the
same values, but in a sorted order:

```ruby
array = [3, 2, 1]
p array.sort
p array
```

This will output `[1, 2, 3]` and then `[3, 2, 1]`, which means the original
array is still the same.

Often times questions need another bit of information passed. E.g., we can ask
a string "Do you start with this character?", and we'll need to pass the
character that we are talking about: `"a string".start_with?("a")`. The answer
to this question will be `true`.

The other role that a method can play is being responsible for executing a
certain command.

For example in Rails applications objects that can be stored to the database
have a method `save`. Of course, the purpose of this method is to save the
object to the database. E.g. `user.save` would save some changes that we've
made to the user before, like, maybe we gave them a new password.

Another example is the method `sort!` on arrays. Different from the method
`sort` (without an exclamation mark), this method tells the array to sort
itself:

```ruby
array = [3, 2, 1]
array.sort!
p array
```

If you run this code, then it will print out `[1, 2, 3]`: the array is now
sorted.

Another example for a method that is a command is the method `puts`. All it
does is print something to the screen, and it always returns `nil`.

Whenever you think about adding a new method to your code it makes sense to
think about the role the method should have. Is it a question, or a command?
