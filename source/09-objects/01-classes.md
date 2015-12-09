# Objects have classes

As mentioned [before](/object_oriented_programming.html) when you run a Ruby
program a little universe (space, scope) is being created, and populated with
concrete objects (things) as defined by your program. These things interact,
and do useful stuff, using certain methods that you call.

Also, each concrete thing (object) is an instance of a general idea or type,
and these ideas are called *classes*.

You can see that objects have classes when you open IRB in your terminal and
ask an object for its class:

```ruby
$ irb
> "this is a string".class
=> String
```

<p class="note">
Objects are concrete instances (manifestations) of classes.
</p>

That means that the following sentence is true: In Ruby, `"a string"` *is a*
`String`.

Hmmmm, yeah, we kinda knew that already, right. However, you can also ask the
same question in Ruby:

```ruby
$ irb
> "this is a string".is_a?(String)
=> true
```

So, the actual string knows that it *is a* `String`, which in Ruby means that
it is an instance of the class `String`. You can do this for any object. E.g.
`1.is_a?(Numeric)`, also returns `true`. This is pretty cool.

We also say that an object is an *instance* of its class. Let's see what that
means.

