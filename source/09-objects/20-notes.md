
<!---
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
-->

