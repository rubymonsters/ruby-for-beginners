# Listing methods

As said above, if you are curious what methods are defined on a certain object,
then you can check the [Ruby documentation](http://ruby-doc.org/core-2.2.0/)
for this class. (Usually the right page conveniently shows up at the top when
you google for "ruby" and the class name.)

However, you can also quickly pop into IRB and ask the object for its methods.
That's right, `methods` is a method defined on all objects (just like `class`,
and `is_a?`).

When you call it then it will return (respond with) an Array with all the
method names that the object has.

It makes sense to sort the Array, so it is easier to read. Like so:

```ruby
$ irb
> "Ruby Monstas".methods.sort
=> [:*, :+, :<, :>, :[], :class, :downcase, :delete, :include?, :is_a?, :length, :prepend, :start_with?]
```

Yep, the method names come as Symbols, because they're considered code.

If you do this yourself, you'll see that the String actually has a lot more
methods. Many of these actually aren't used very often, but some are quite
useful. We have stripped the Array down a little, because we want to talk about
some of these methods more.

## Chaining method calls

Btw the code above also demonstrates that methods can be "chained": When we
call a method on an object it will return another object to us. We can then
immediately call another method on that new object, and so on.

In our example above the method `methods` returns a Array of names. And
Arrays respond to (have) the method `sort`, so we can call this method
immediately, by using another dot.

We could chain some of the method calls from our String example above like so:

```ruby
$ irb
> name = "Ruby Monstas"
> name.prepend("Oh, hello, ").upcase
=> "OH, HELLO, RUBY MONSTAS"
```

So we have a String `"Ruby Monstas"`, prepend another String to it, which
returns a new String `"Oh, hello, Ruby Monstas"`, on which we immediately call
the method upcase.

Pretty handy.

As you can see Ruby will first evaluate the bit `name.prepend("Oh, hello, ")`.
It needs to do that so it knows the object (the new String) that is going
to be returned from this, so it can then call the method `upcase` on it.

Does this make sense?
