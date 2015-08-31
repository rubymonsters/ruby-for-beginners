# Initializing objects

*In the moment of birth*

Let's start over, and define a new class.

Remember how we said that objects can be thought of as two things: They know
*stuff*, and they can *do things*.

Let's define a class `Person`. People obviously also know things, and can do things.

Here's how to define a shiny, new, empty class `Person`:

```ruby
class Person
end
```

Again, that's not a very useful class, but we can instantiate it, and create an
actual, concrete person instance (object) from it:

```ruby
p Person.new
```

Now, before we add any behaviour (methods) to our class, we want to be able to
give it some initial data: In our case, we want the person to know its own
name.

We can do this like so:

```ruby
class Person
  def initialize(name)
  end
end
```

You see that we add a method called `initialize` to the class, and this method
accepts a single argument, which is called `name`. At the moment, this method
is still empty. We'll add some code to it in a bit.

The important bit to learn for you is: the method `initialize` is a special
method with a special meaning in Ruby:

Whenever you call the method `new` on a class, as in `Person.new`, the class
will create a new instance of itself. It will then, internally, call the method
`initialize` on the new object. Doing so it will simply *pass all the
arguments* that you passed to `new` *on to* the method `initialize`.

So we can now create a new person instance by calling ...

```ruby
Person.new("Ada")
```

... and the string `"Ada"` will be passed on to our `initialize` method, and
end up being assigned to the local variable `name`.

<p class="hint">
The special method <code>initialize</code> is called under the hood when the
object has been created by the class method <code>new</code>.
</p>

Obviously, our `initialize` method does not *do* anything with the String
passed, yet. That's right. We'll get to that in the next chapter.

To recap, when you call `new` on the class `Person`, and pass the string
`"Ada"` then the method `new` will create a new instance of the class, and call
`initialize` on it, passing the same argument list, which in our case is the
single string `"Ada"`.

When we create a new instance of a class by the way of calling the method `new`
on that class, we also say that we "instantiate" that object: By calling
`Person.new` we instantiate a new person object.


