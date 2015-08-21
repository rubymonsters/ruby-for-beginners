# Predicate methods

If you check the list of methods on our String above you see that in Ruby we
can have methods that end with a question mark `?`.

This makes them read like a question, which is pretty awesome.

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
check the chapter that explains that [operators are methods, too](/operators/methods.html).

Alright, we now have discussed how objects, classes, and methods relate to each other.
And we've learned how to call (use) methods on objects like Strings and numbers.

With this knowledge we can now look at implementing (defining, creating) our
very own methods. This will help you understand better how exactly methods "take"
arguments, and how they can work with them. And you'll understand why we keep
saying a method "returns" an object.

After that section we'll then finally be able to define new "things", i.e.
create our own classes, and instantiate objects from them.
