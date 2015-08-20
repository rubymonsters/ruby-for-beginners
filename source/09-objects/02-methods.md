# Objects have methods

Objects have methods attached to them, allowing us to do interesting stuff with
them. An object's methods are things that the object can *do*.

Like you can ask a person for their name, and they can tell their name to you.
Or we can ask them to prepare and bring a cup of tea for us. Or we could ask
them to remember a phone number, or email password.

As Rubyists we actually say that we "talk to objects". And we do so by using
methods that they have. We already have used methods in the previous chapter:
`class` and `is_a?` are methods that we called on objects like the String
`"some string"`.

## Calling methods

In Ruby, methods are called on objects by using a dot, like so:

```ruby
object.method
```

For example, the class `String` defines methods like these:

```ruby
$ irb
> name = "Ruby Monstas"
> name.upcase
=> "RUBY MONSTAS"
> name.downcase
=> "ruby monstas"
> name.length
=> 12
```

And so on. You can have a look at all the methods that the class `String`
defines on Ruby's [documentation page for this class](http://ruby-doc.org/core-2.2.0/String.html).

Imagine the string `name` is a person you can talk to. You can ask questions by
"sending a message" to them, and they'll respond by sending (or returning)
something back. (The term "sending messages" actually is used instead of
"calling a method" in programming, and specifically in Ruby.)

So, you can ask this string to hand you an "upcased" version of itself. And
it responds by doing so. Or you can ask it for its lenght, and it responds
by returning the number `12` to you.

Most methods in Ruby work this way: You ask an object to return a bit of
information about itself (such as a String's length), or a modified
(transformed) version of itself (such as a downcased version of the String).

## Passing information

Sometimes an object needs a little bit of extra information in order to do
what you ask for.

For example the class String defines the method `delete` which returns another
String with some of the characters deleted. In order to do so, of course, it
needs to know which characters we'd like to remove.

We can pass these by appending parentheses `()` to the method call, and
including the extra bit of information (in our case another string) into the
parentheses like so:

```ruby
$ irb
> name = "Ruby Monstas"
> name.delete("by Mo")
=> "runstas"
```

Another example for this is the method `prepend`, which returns a new String
with the given String prepended:

```ruby
> name = "Ruby Monstas"
> name.prepend("Oh, hello, ")
=> "Oh, hello, Ruby Monstas"
```

The "extra bit of information" is called an *argument*. The general notation
for passing arguments is the following. Some methods need more than one
argument, and in this case we separate them by commas:

```ruby
object.method(an_argument, another_argument, ...)
```

Sometimes methods do not need any arguments (extra bits of information) passed
in order to do their job. E.g. the method `length` can know the length of the
String just so. Sometimes they need one or more arguments.

So how do you know? You might remember, over time, for some important methods,
but most of us also check the documentation quite frequently, too.

## Listing methods

As said above, if you are curious what methods are defined on a certain object,
then you can check the [Ruby documentation](http://ruby-doc.org/core-2.2.0/)
for this class (usually shows up at the top when you google for "ruby" and the
class name). However, you can also quickly pop into IRB and ask the object for
its methods.

That's right, `methods` is a method defined on all objects (just like `class`,
and `is_a?`).

When you call it then it will *return* a list of all of the method names that
the object has. It makes sense to sort this list, so it is easier to read. Like
so:

```ruby
$ irb
> "Ruby Monstas".methods.sort
=> [:*, :+, :<, :>, :[], :class, :downcase, :delete, :include?, :is_a?, :length, :prepend, :start_with?]
```

If you do this yourself, you'll see that the String actually has a lot more
methods. We have stripped the list down a little, because we want to talk
about some of these methods more.

This example also demonstrates that methods can be "chained": When we call a
method on an object it will return another object to us. We can then
immediately call another method on that new object, and so on.

For example, we could chain some of the method calls from our String example
above like so:

```ruby
$ irb
> name = "Ruby Monstas"
> name.prepend("Oh, hello, ").upcase
=> "OH, HELLO, RUBY MONSTAS"
```

That's pretty handy.

## Predicate methods

If you check the list of methods on our String above you see that in Ruby we
can have methods that end with a question mark `?`. This makes them read like a
question, which is pretty awesome.

By convention, in Ruby, these methods return either `true` or `false`. For
example, we can ask a number if it is even or odd:

```ruby
$ irb
> 5.even?
=> false

> 5.odd?
=> true
```

Or you can ask the number if it's between two other numbers. Obviously this
methods needs us to pass those two other numbers. So now we also have an example
of a method that takes two arguments:

```ruby
> 5.between?(11, 20)
=> false

> 5.between?(1, 10)
=> true
```

These methods are called *predicate methods* in Ruby. Not quite sure why, maybe
because of the historical math context of programming.

<p class="hint">
Predicate methods that end with a question mark <code>?</code> return either <code>true</code> or <code>false</code>.
</p>

Strings also define some predicate methods:

```ruby
> name = "Ruby Monstas"
> name.start_with?("a")
=> false
> name.start_with?("R")
=> true
```

Do you also think it's kinda odd that `name.start_with?("a")` reads almost like
English, but not quite? Maybe the method could have been named `starts_with?`
instead, right? That's true. This is because Matz, the creator of Ruby, is not
a native English speaker, and some names sound right in Japanese when
translated literally.

Also:

```ruby
> name = "Ruby Monstas"
> name.include?("r")
=> false
> name.include?("by")
=> true
```

When we check what methods there are defined on a number, we find some with the
same name, but also different ones:

```ruby
$ irb
> 1.methods.sort
=> [:*, :+, :-, :/, :between?, :even?, :odd?, :zero?]
```

Let's try `zero?` as a last example.

```ruby
> 1.zero?
=> false
> 0.zero?
=> true
```

Oh, by the way, if you're curious why these method names all start with a colon,
check the chapter about [Symbols](/more_built_in_classes/symbols.html). And if
you're curious why operators like `*`, `+`, `-` and so on are also listed here,
check the chapter that explains that [operators are methods, too](/13-operators/methods.html).

Alright, we now have discussed how objects, classes, and methods relate to each other.
And we've learned how to call (use) methods on objects like Strings and numbers.

With this knowledge we can now look at implementing (defining, creating) our
very own methods. This will help you understand better how exactly methods "take"
arguments, and how they can work with them. And you'll understand why we keep
saying a method "returns" an object.

After that section we'll then finally be able to define new "things", i.e.
create our own classes, and instantiate objects from them.
