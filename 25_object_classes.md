# Objects have classes

You can see that objects have classes when you open IRB in your terminal and
ask a string or array for their class:

```ruby
$ irb
> "this is a string".class
=> String
> ["an", "arrray"].class
=> Array
```

That means that the following sentence is true: In Ruby, `"a string"` *is a*
`String`.

Yeah, we kinda knew that already, right.

However, you can also ask the same question in Ruby:

```ruby
$ irb
> "this is a string".is_a?(String)
=> true
```

So, the actual string knows that it *is a* `String`, which in Ruby means that
it is an instance of the class `String`. You can do this for any object. E.g.
`1.is_a?(Numeric)`, and `[1, 2, 3].is_a?(Array)` also return `true`. We think
this is pretty cool.

Even more interesting, you can also ask a *class* for its class:

```ruby
$ irb
> String.class
=> Class
```

There's a class named `Class`, and the class `String` is an object that *is a*
`Class`.

Ok, this might get a little confusing, when you think about it too hard, and to
be honest, it might not be super useful in praxis. However, it is kinda cool to
see how in Ruby, where everything is an object, even classes are objects, and
have their own class.

But let's move back to more practical things.
