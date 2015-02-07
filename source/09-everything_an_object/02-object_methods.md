# Calling methods

Objects have methods attached to them, allowing us to do interesting stuff with
them. An object's methods are like things that a person can *do*. Like we can
ask a person for their name, and they will "return" their name to us. Or we
can ask them to prepare and bring a cup of tea for us. Or we could ask them
to remember a phone number, or email password.

As Rubyists we actually say that we "talk to objects". And we do so by calling
methods on them. We used methods in the example above: `class` and `is_a?` are
methods that we called on objects like the string `"this is a string"`.

In Ruby, methods are called on objects by using a dot, like so:


```ruby
object.method
```

If we need to pass arguments to the method we call, then we add parentheses,
and separate the arguments by comma:

```ruby
object.method(an_argument, another_argument)
```

If you are curious what methods are defined on a certain object, then you can
quickly pop into IRB and ask the object for its methods.

That's right, `methods` is a method defined on all objects (just like `class`,
and `is_a?`).

When you call it then it will *return* an array of symbols, which are all of
the method names that the object has. It makes sense to sort this array, so it
is easier to read. `sort` is a method that is defined on arrays. So we can
call the method `sort` on the array that is returned by the method `methods`,
like so:

```ruby
$ irb
> 1.methods.sort
=> [:*, :+, :-, :/, :between?, :even?, :odd?, :zero?]
```

If you do this yourself, you'll see that the object `1` actually has a lot more
methods. We have stripped the array down a little, because we want to talk
about some of these methods later.


