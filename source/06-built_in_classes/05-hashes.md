# Hashes

*Hashes are like dictionaries*

Hashes are another very useful thing that can be used to store objects.

Unlike arrays which are mere lists, hashes are like dictionaries: You can use
them to look up one thing by another thing. We say: we look up a value from a
hash using a key. Or one could say: *Please get me the value that is
associated with this key.*

Imagine a real dictionary that translates from English to German. When you
look up the English word "hello" then you'll find the German "Hallo". When
you look up "one" then you'll find "eins", and so on.

Hashes work pretty much like this.

You can create a hash by pointing a key to a value with `=>`, separate these
key/value pairs with commas, and enclose the whole thing with curly braces.
This is how it looks:

```ruby
{ "one" => "eins", "two" => "zwei", "three" => "drei" }
```

This defines a hash that contains 3 key/value pairs, meaning that we can look
up three values (the strings `"eins"`, `"zwei"`, and `"drei"`) using three
different keys (the strings `"one"`, `"two"`, and `"three"`).

Now, how do you actually look up the value that is associated with the key
`"one"`? Just like with arrays you use sqare brackets, but instead of passing
a number indicating the position you now pass the key. Like so:

```ruby
dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
puts dictionary["one"]
```

In this example, `dictionary` is a hash defined on the first line. `["one"]`
looks up the value associated to the key `"one"`, which is `"eins"`. This value
will be passed to `puts` which outputs it to the screen.

You can use any kind of object as keys, and you can store any kind of object
as values. So, for example, these are all valid hashes, too:

```ruby
{ 1 => "eins", 2 => "zwei", 3 => "drei" }
{ :one => "eins", :two => "zwei", :three => "drei" }
{ :de => { :one => "eins", :two => "zwei", :three => "drei" } }
```

The last one of these examples is a nested hash: there's another hash associated
(stored) as a value for the key `:de`. And this other hash now has three
key/value pairs. This example is actually pretty darn close to what Rails uses
for translating strings to different languages.

The Ruby community has come up with the funny name "hash rocket" for the bit of
syntax `=>` that separates a key from a value, which we think is pretty cool :)

On formatting: Note that there's one space inside the curly braces on both
sides, around the `=>` hash rocket, and after each comma.

Note: Today, there actually are two different syntaxes for defining hashes with
curly braces. We use the old syntax, and ignore the new one, for now, and here's
why:

Up to a certain version of Ruby the syntax that uses hash rockets was the only
syntax to create hashes. Then, a few years back, a new syntax was introduced,
and many programmers love to use it, because it takes a little less space, and
because it looks a lot like JSON, which is a data format that is widely used in
web applications.

The new hash syntax looks like this:

```ruby
{ one: "eins", two: "zwei", three: "drei" }
```

Using this syntax we tell Ruby that we want the keys to be symbols.

Hmmmm? We just learned that symbols are defined by prepending a word with a
colon like `:one`, right? Well, yes, that's just how it works: If you define
a hash using this syntax, then you'll get a hash that has symbols as keys.

We found the new syntax pretty confusing for beginners: It is slightly less
explicit and obvious, and you have to learn another piece of information.

That's why we simply ignore it in our study groups while we learn what hashes
are and how you can use them.

So when you see a hash using the new syntax somewhere else, you now know
what it means. Simply remember that these two hashes are exactly the same:

```ruby
{ :one => "eins", :two => "zwei", :three => "drei" }
{ one: "eins", two: "zwei", three: "drei" }
```

Exercises: Now would be a good time to do some of the [exercises on
arrays](/16-exercises/03-hashes_1.html).
