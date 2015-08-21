# Passing arguments

Just like our "stand-alone" methods from above, sometimes an object needs a
little bit of extra information in order to do what you ask for. In other
words, we might need to pass arguments to these methods, too.

For example the class String defines the method `delete` which returns another
String with some of the characters deleted. In order to do so, of course, it
needs to know which characters we'd like to remove.

Again, we can pass these by appending parentheses `()` to the method call (the
name). We can then include the extra bit of information needed (in our case
another string) inside the parentheses like so:

```ruby
$ irb
> name = "Ruby Monstas"
> name.delete("by Mo")
=> "runstas"
```

Hm. Not sure what "runstas" means.

Anyhow, another example for a method that needs an argument is the method
`prepend` on Strings. This method returns a new String with the given String
prepended:

```ruby
> name = "Ruby Monstas"
> name.prepend("Oh, hello, ")
=> "Oh, hello, Ruby Monstas"
```

Again, not all methods need arguments (extra bits of information) in order to
do their job. E.g. the method `length` on Strings can know the length of their
String just so. Sometimes they need one or more arguments.

So how do you know?

You might remember, over time, for some important methods, but most of us also
check the documentation quite frequently, too. Some times it's just fine to
try it out quickly, and only check the documentation if it does not work as
expected.

