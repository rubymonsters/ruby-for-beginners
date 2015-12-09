# Attribute writers

*Setting information*

Imagine in our application a person not only needs a name, but also a password.
However, let's also imagine that, at the time of the creation of a new person
instance, this password is not yet known. (Who would give a toddler an email
password anyway?)

Instead we want to be able to tell the person object about its email password
later.

We can do this like so:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def password=(password)
    @password = password
  end
end
```

As you can see, the method `password=` does nothing else but take a single
argument (called `password`) and assign the value of this local variable to the
instance variable `@password`.

This method's structure looks exactly the same as the method `initialize`,
doesn't it? Execpt that `initialize` is called whenever you call `new` on the
class. Our new method `password=` needs to be called on the object itself,
once it has been created.

Again, because this kind of method is used so often, there's another name for
it: it's an attribute writer. (And again, we think it should have been called
an "instance variable writer" instead.)

Now, we can use the attribute writer like so:

```ruby
person = Person.new("Ada")
person.password=("super secret")
p person
```

If you execute this, then it will print out:

```
#<Person:0x007fb61c1edcf8 @name="Ada", @password="super secret">
```

So, yeah, we can see that, after calling `person.password=("super secret")`
the object now has an instance variable defined, i.e., the person now knows
their password, too.

<p class="hint">
An attribute writer allows setting an instance variable.
</p>

That method call looks a little odd though, doesn't it?

Remember what we've said above about the syntax sugar that Ruby adds for the
assignment operator `=`?

Exactly the same works for attribute writers, that is, methods that end with an
equals sign `=`.

That's right. So we can also write this instead:

```ruby
person = Person.new("Ada")
person.password = "super secret"
```

And this reads just so much better, doesn't it?

Just remember that, under the hood, when running your code, Ruby translates the
line `person.password = "something"` to `person.password=("something")`, and
this simply calls the method `password=`, passing the value on the right hand
side as an argument: it's just another method :)

We think this is pretty cool.
