# Initializing objects

*In the moment of birth*

In order to make our class a little bit more useful, we want to be able to give
it some initial data. In our case, we want the person to know its own name.

We can do this like so:

```ruby
class Person
  def initialize(name)
  end
end
```

Now, there are a couple of things going on here. Let's go through them one by
one.

You see that we add a method called `initialize` to the class, and this method
accepts a single argument, which is called `name`. At the moment, this method
is still empty. We'll add some code to it in a bit.

On formatting: the method definition is indented by one level, that is, 2
spaces. We do this in order to signal that the method `initialize` belongs
to the class `Person`. Everything between the line `class Person` and the
final line `end` is called the "class body", and just like method bodies we
indent them by one more level.

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

Obviously, our `initialize` method does not *do* anything with the String
passed, yet. That's right. We'll get to that in the next chapter.

To recap, when you call `new` on the class `Person`, and pass the string
`"Ada"` then the method `new` will create a new instance of the class, and call
`initialize` on it, passing the same argument list, which in our case is the
single string `"Ada"`: as in `object.initialize("Ada")`.

When we create a new instance of a class by the way of calling the method `new`
on that class, we also say that we "instantiate" that object: By calling
`Person.new` we instantiate a new person object.


