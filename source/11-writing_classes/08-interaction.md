# Interacting Objects

We're now able to create our own objects. However, they don't do a whole lot,
yet, right? Why not create two people, and let them greet each other.

Let's see.

Here's what we'd like to achieve:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

person = Person.new("Anja")
friend = Person.new("Carla")

person.greet(friend)
```

We'd like this to print out the following for starters:

```ruby
Hi Carla!
```

If we run the code above we'll get an error message that tells us what to do next:

```
NoMethodError: undefined method `greet' for #<Person:0x007fbb5e9c88c8 @name="Anja">
```

Right, we need to define a method `greet`. Let's do that:

```ruby
class Person
  # methods from above ...

  def greet
  end
end
```

If we run this code, we'll now get a new error message. Great, that's progress:

```
ArgumentError: wrong number of arguments (1 for 0)
```

Right, how would one person greet another without knowing who that other person is?
So we need to make our method accept an argument:

```ruby
class Person
  # methods from above ...

  def greet(other)
  end
end
```

If we run this we won't see an error message any more. Yay! However, it also
does not print anything so far - our method does not do anything, yet.

Alright, let's add some actual behaviour, and print out "Hi!" for starters.

```ruby
class Person
  # methods from above ...

  def greet(other)
    puts "Hi!"
  end
end
```

What happens when you run that? It works, right. This should output `Hi!` to the screen.

However, how can Anja greet Carla, specifically? How can any person greet any
other person? Well, the method knows the person to greet (she has been passed
as an argument to the method) so she can ask her for her name:

```ruby
class Person
  # methods from above ...

  def greet(other)
    puts "Hi " + other.name + "!"
  end
end
```

Does this make sense?

Let's have another look at the full code:


```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet(other)
    puts "Hi " + other.name + "!"
  end
end

person = Person.new("Anja")
friend = Person.new("Carla")

person.greet(friend)
```

So we instantiate two `Person` objects, and assign them two variables `person`
and `friend`. Then we call the method `greet` on the first one (Anja), and
pass the second one (`friend`, which is Carla) as an argument.

Now Ruby jumps into the method body of the method `greet`, and assigns the
local variable name `other` to the `Person` instance passed (i.e. Carla).

It then asks the `Person` instance `other` for their name (which will return
the String `"Carla"`, and concatenates it to (glues it together with) two other
strings `"Hi "` and `"!"`. So this results in a new String `Hi Carla!` which it
then passes to `puts`.

Ok, let's spice that up a little, and let Anja add her own name to this String,
too:

```ruby
class Person
  # methods from above ...

  def greet(other)
    puts "Hi " + other.name + "! My name is " + name + "."
  end
end
```

Nice. This now outputs:

```
Hi Carla! My name is Anja.
```

Remember how you could call the method `add_one` from another method `add_two`
[before](/writing_methods/combining.html)? The same works here, too: We can
call the person's own method `name` by just using it, since this method is
defined on the same class, and thus every instance of `Person`. We'll look
at this a little more in the [next chapter](/writing_classes/self.html).

For now let's add another line at the end, and let Carla greet Anja back.

Again, here's the full code:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet(other)
    puts "Hi " + other.name + "! My name is " + name + "."
  end
end

person = Person.new("Anja")
friend = Person.new("Carla")

person.greet(friend)
friend.greet(person)
```

And this outputs:

```
Hi Carla! My name is Anja.
Hi Anja! My name is Carla.
```

What do you think?

Of course this is still quite a simplistic example. It already shows how you
can "model" a certain "real-world" concept in terms of Ruby code, instantiate
it, and let it interact with another thing.

By the way if you'd like to see how to make the method `greet` more pretty,
and a little bit easier to read, check out the chapter on
[String interpolation](/bonus/string_interpolation.html).
