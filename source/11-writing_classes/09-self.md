# Object Scope and Self

Remember how we said that when Ruby finds a method call she then deviates from
the normal control flow which goes from top to bottom? Instead she jumps into
the method body.

We also said that this method body has its own [scope](/writing_methods/scopes.html),
like a shiny, new room where local variables from other scopes are not visible.
Instead it has its own local variables, some of which might be defined via the
method's arguments.

And we also said that inside any object's method all instance variables of
this object, and all other methods of this object are also visible.

We also may have a look at that mysterious [top-level object](/bonus/top_level.html)
that Ruby enters when she starts executing a program, or IRB.

We are now finally ready to put all these things together a little more, and
introduce a new keyword: `self`.

## The Object Scope

In fact, in Ruby, there are even more scopes than just the local method's
scope:

There's the method's local scope, which holds all local variables. And there's
the object's scope which holds all instance variables and method names.

When Ruby's control flow jumps into a method then both of these scopes are
visible at the same time. For any given name Ruby will first check the local
scope, and then the object scope.

In reality this most importantly means that from any method on an object, you
can access:

* all local variables
* all instance variables
* all of the object's methods

It also means that one can overwrite, sometimes accidentally, method names
with variable names. Remember they read just the same in Ruby? While this
is a really cool feature, it also means we need to be aware of it.

Consider this code:

```ruby
class Person
  # ...

  def name
    @name
  end

  def greet(other)
    name = other.name
    puts "Hi " + name + "! My name is " + name + "."
  end
end
```

As you can see this defines a new local variable `name`. The code is very
similar to what we had [before](/writing_classes/interaction.html), except
that we store the `other` person's name to a local variable `name` first,
and then use this variable on the next line when we put together our String.

This breaks our code, of course, in the sense that we don't get the expected
greeting any more. Instead it contains the same name twice:

```
Hi Carla! My name is Carla.
```

That is because, on the last line of the method `greet`, when Ruby looks at the
word (identifier) `name` she first checks the local scope of the method, and
finds a local variable defined, so she uses it. Only if there was no local
variable defined she would check the object's scope, and find the method with
the same name `name`, and call it.

<p class="hint">
When she finds an identifier, Ruby looks for a local variable first, and then for a method.
</p>

Luckily, there's a way to still access the object's scope:

## Self

Every object knows itself, in every method, by the way of calling `self`.
This is a special keyword in Ruby, that means just that: The object itself.

Let's try that, and output `self`. In order to do that we need to add it
somewhere inside the object. Any method would be good for that, but let's
just use the `initialize` method:

```ruby
class Person
  def initialize(name)
    @name = name
    p self
  end
end

person = Person.new("Anja")
p person
```

This should output something like this:

```ruby
#<Person:0x007f9994972428 @name="Anja">
#<Person:0x007f9994972428 @name="Anja">
```

As you can see we output the same object twice. Once in the `initialize` method
using `p self`, and once in the outer scope using `p person`. You can also see
that the cryptic looking object id is the same for both instances. So we can
know it's indeed the very same object.

<p class="hint">
Inside any method the object can be referred to using the keyword <code>self</code>.
</p>

So we can fix our code from above like this:

```ruby
class Person
  def name
    @name
  end

  def greet(other)
    name = other.name
    puts "Hi " + name + "! My name is " + self.name + "."
  end
end
```

Now we call the method `name` on two different objects again. When Ruby sees
`self` she knows that we're referring to the person object, and she calls the
method `name` on it.

This fixes our greeting:

```
Hi Carla! My name is Anja.
```

## Keywords

Why do we keep saying that `self` is a keyword? Well, because is not a method.
It's a "special thing" in Ruby. For example this means that the following will
raise an error:

```ruby
person = Person.new("Anja")
p person.self
```

This raises the error:

```
NoMethodError: undefined method `self' for #<Person:0x007f9994972428 @name="Anja">
```

It's not a method, it's a special thing.

Other keywords that also aren't methods (or objects, or classes) are, for
example, `def`, `class`, and `end`. You'll also learn about `do`, `if`, `elsif`
and `else` a little later.

<p class="hint">
Keywords are words that have a special meaning in Ruby, such as
<code>class</code>, <code>def</code>, <code>end</code>, and <code>self</code>.
</p>
