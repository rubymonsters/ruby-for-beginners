# Classes define objects

As mentioned [before](/object_oriented_programming.html) when you run a Ruby
program a little universe (space, scope) is being created, and populated with
concrete objects (things) as defined by your program. These things interact,
and do useful stuff, using certain methods that you call.

Also, each concrete thing (object) is an instance of a general idea or type,
and these ideas are called classes in Ruby.

You can see that objects have classes when you open IRB in your terminal and
ask an object for its class:

```ruby
$ irb
> "this is a string".class
=> String
```

That means that the following sentence is true: In Ruby, `"a string"` *is a*
`String`.

Yeah, we kinda knew that already, right. However, you can also ask the same
question in Ruby:

```ruby
$ irb
> "this is a string".is_a?(String)
=> true
```

So, the actual string knows that it *is a* `String`, which in Ruby means that
it is an instance of the class `String`. You can do this for any object. E.g.
`1.is_a?(Numeric)`, and `[1, 2, 3].is_a?(Array)` also return `true`. This is
pretty cool.

## Lift off to mindblow

Even more interesting, you can also ask a *class* for its class:

```ruby
$ irb
> String.class
=> Class
```

There's a class named `Class`, and the class `String` is an object that *is a*
`Class`.

Funnily, the class `String` is not only a class, but also, at the same time, an
object:

```ruby
$ irb
> String.is_a?(Object)
=> true
```

And even more interesting, the class `Class` also is an object, the class of
the class `Class` is `Class` (i.e. itself), and the class `Object` is an
object, too:

```ruby
$ irb
> Class.is_a?(Object)
=> true
> Class.class
=> Class
> Object.is_a?(Object)
=> true
```

Wow.

Ok, this might get a little confusing, when you think about it too hard.

To be honest, none of this is super useful knowledge in practice, most of the
time (unless you're working with pretty advanced programming techniques such
as [meta programming](http://ola-bini.blogspot.de/search/label/metaprogramming),
i.e. code that, when run, defines other code).

However, it is kinda cool to see how in Ruby, where everything is an object,
even classes are objects, and have their own class.

Anyhow. Let's move back to more practical things.

## Classes define methods

Every object is an *instance* of a class. The class is kind of a blue print for
the concrete object. Every time a concrete object (such as the String `"one
string"`, the string `"another string"`, and so on) is created, we say that the
class is *instantiated*.

What does that mean?

Classes have a bunch of characteristics, but most importantly, every class
defines a bunch of methods. Every time a new object is created (instantiated)
from this class this new object "inherits" all of these methods.

We'll explain more about methods in the next chapter. But for now we can
already point out that all concrete Strings that you use in your code will all
have the same methods defined ... because they're all created (instantiated)
from the the same class.



