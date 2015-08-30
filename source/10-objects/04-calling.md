# Calling methods

In Ruby, methods that belong to (are defined on) objects can be used (called)
by adding a dot, and then the method name, like so:

```ruby
object.method
```

That's like saying *Hey object, please do [method]*.

Let's try that out in IRB.

For example, the class `String` defines methods like `upcase` (*Give me an
uppercase version of yours*), `downcase` (*What's the downcased version of
yours*), and `length` (*Hey string, what's your length?*).

Here's how we can call them:

```ruby
$ irb
> name = "Ruby Monstas"
> name.upcase
=> "RUBY MONSTAS"
> name.downcase
=> "ruby monstas"
> name.length
=> 12
```

And so on.

In other words, you first address, or mention, the object that you want to talk
to, and then, with the dot `.`, "send a message" to the object by specifying
the method name. We also say: "you call the method upcase on the string".

<p class="hint">
A dot is used to call a method on an object.
</p>

Imagine the string `name` is a person you can talk to. You can ask questions by
"sending a message" to them, and they'll respond by sending (returning)
something back. The term "sending messages" actually is used instead of
"calling a method" in programming, and specifically in Ruby.

So, you can ask the string to hand you an "upcased" version of itself. And
it responds by doing so. Or you can ask it for its length, and it responds
by returning the number `12` to you.

You can have a look at all the methods that the class `String` defines
(responds to) on Ruby's
[documentation page for this class](http://ruby-doc.org/core-2.2.0/String.html).

Most methods in Ruby work this way: You ask an object to return a bit of
information about itself (such as a String's length), or a modified
(transformed) version of itself (such as a downcased version of the String).

<p class="hint">
Most methods are questions, and return a relevant value.
</p>

Others modify the object itself, and some have so called side-effects, and
modify something else, e.g. `puts` and `p` both output something to the
screen. Other methods might save files, send emails, or store things to
a database.

<p class="hint">
Some methods are commands, and change the object, or the system (e.g. by saving a file).
</p>


