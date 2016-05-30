# Passing arguments

*Extra information needed*

Sometimes an object needs a
little bit of extra information in order to do what you ask for.

For example the class `String` defines the method `delete` which returns
another String with some of the characters deleted. In order to do so, of
course, it needs to know which characters we'd like to remove.

We can pass things by appending parentheses `()` to the method call (the name).
We can then include the extra bit of information needed (in our case another
string) inside the parentheses like so:

```ruby
$ irb
> name = "Ruby Monstas"
> name.delete("by Mo")
=> "Runstas"
```

Hm. Not sure what "Runstas" means. Ideas? Let us know.

Anyhow, another example for a method that needs an argument is the method
`prepend` on Strings. This method returns a new String with the given String
prepended:

```ruby
> name = "Ruby Monstas"
> name.prepend("Oh, hello, ")
=> "Oh, hello, Ruby Monstas"
```

These extra bits of information are called *arguments*. We'll discuss them more
once we get to define [our own methods](/writing_methods.html).

Not all methods need these extra bits of information (arguments) in order to do
their job.  E.g. the method `length` on Strings knows the length of their
String just so (because it knows its String). Sometimes they need one or more
arguments though.

So how do you know?

You might remember, over time, for some important methods, but most of us also
check the documentation quite frequently, too. Some times it's just fine to
try it out quickly, and only check the documentation if it does not work as
expected.

