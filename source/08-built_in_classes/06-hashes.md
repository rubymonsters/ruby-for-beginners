# Hashes

*Dictionaries: look up one thing by another*

Hashes are another very useful, and widely used kind of thing that can be used
to store other objects.

Unlike arrays which are mere lists, Hashes are like dictionaries:

You can use them to look up one thing by another thing. We say: we look up a
value from a Hash using a key. Or one could say: *Please get me the value that
is associated with this key.*

Imagine a real dictionary that translates from English to German. When you
look up the English word "hello" then you'll find the German "Hallo". When
you look up "one" then you'll find "eins", and so on. The authors of this
dictionary have assigned a German word (a value) to an English word (the key).

Hashes work pretty much like this.

<p class="hint">
A Hash assigns values to keys, so that values can be looked up by their key.
</p>

We also refer to a value that is assigned to a key as *key/value pairs*. A
Hash can have as many key/value pairs as you like.

## Creating a Hash

In Ruby you can create a Hash by assigning a key to a value with `=>`, separate
these key/value pairs with commas, and enclose the whole thing with curly
braces.

This is how it looks:

```ruby
{ "one" => "eins", "two" => "zwei", "three" => "drei" }
```

This defines a Hash that contains 3 key/value pairs, meaning that we can look
up three values (the strings `"eins"`, `"zwei"`, and `"drei"`) using three
different keys (the strings `"one"`, `"two"`, and `"three"`).

By the way, the Ruby community has come up with the name *hash rocket* for the
bit of syntax `=>` which separates a key from a value, ... we think that is
pretty cool to know :)

<p class="hint">
A Hash is created by listing key/value pairs, separated by hash rockets, and enclosed by curly braces.
</p>

## Looking up a value

Now, how do you actually look up the value that is associated with the key
`"one"`?

Just like with Arrays you use sqare brackets, but instead of passing
a number indicating the position you now pass the key. Like so:

```ruby
dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
puts dictionary["one"]
```

Do you reckognize how we, on the second line, use a variable name to
refer to the Hash defined on the first line?

In this example, `dictionary` is a Hash defined on the first line. `["one"]`
looks up the value associated to the key `"one"`, which is `"eins"`. This value
will be passed to `puts` which outputs it to the screen.

## Setting a key to a value

Also, just like with Arrays, there's a way to set key/value pairs on an existing
Hash:

```ruby
dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
dictionary["zero"] = "null"
puts dictionary["zero"]
```

This prints out `null`.

You could also overwrite existing key/values the same way. For example this
would set the word `"uno"` to the key `"one"` (i.e. overwrite the existing pair
with the value `"eins"`):

```ruby
dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
dictionary["one"] = "uno"
puts dictionary["one"]
```

So, this would now output `uno`.

## Any kind of objects

You can use any kind of object as keys, and you can store any kind of object
as values.

For example, these are all valid Hashes, too:

```ruby
{ 1 => "eins", 2 => "zwei", 3 => "drei" }
{ :one => "eins", :two => "zwei", :three => "drei" }
{ "weights" => ["pound", "kilogram"], "lengths" => ["meter", "mile"] }
{ :de => { :one => "eins", :two => "zwei", :three => "drei" } }
```

The first example uses numbers as keys, while the second one uses Symbols,
which is quite a common thing to do in Ruby.

In the third example you can see that one can use Arrays as values in Hashes.
So if you'd look up the key `"weights"` you'd now get an Array back.

Not quite sure where you'd use a Hash like the third line in real code, but the
last line is actually pretty darn close to what Rails uses for translating
strings to different languages:

It is also an example of a nested Hash. There's another Hash associated
(stored) as a value for the key `:de` (representing the language German). And
this other Hash now has three key/value pairs. So a Rails programmer could look
up how to translate "one" to German, and get "eins" back.

<p class="hint">
Hashes can use any kind of objects as keys and values.
</p>

<p class="hint formatting">
On formatting: Note that there's one space inside the curly braces on both
sides, around the <code>=></code> Hash rocket, and after each comma. But there
are, again, no spaces inside that square brackets <code>[]</code> that define
the Arrays on the third line.
</p>

## Missing values

What happens if we try to look up a key that does not exist?

Again, just as with Arrays, we'll get back `nil`, meaning "nothing":

```ruby
$ irb
> dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
> dictionary["four"]
=> nil
```

Does this make sense?

## Things you can do with Hashes

The main purpose of a Hash is being able to lookup a value by a key.

However, here are a few other things you can do with Hashes, too.

Again, look at them, and play with them in `irb`. Don't necessarily put too
much effort into memorizing all of them ...

You can merge two Hashes:

```ruby
$ irb
> { "one" => "eins" }.merge({ "two" => "zwei" })
=> { "one" => "eins", "two" => "zwei" }
```

`fetch` does just the same as the square bracket lookup `[]` discussed before,
but it will raise an error if the key is not defined:

```ruby
$ irb
> dictionary = { "one" => "eins" }
> dictionary.fetch("one")
=> "eins"
> dictionary.fetch("two")
KeyError: key not found: "two"
```

`keys` returns an Array with all the keys that a Hash knows:

```ruby
$ irb
> dictionary = { "one" => "eins", "two" => "zwei" }
> dictionary.keys
=> ["one", "two"]
```

`length` and `size` both tell how many key/value pairs the Hash has:

```ruby
$ irb
> dictionary = { "one" => "eins", "two" => "zwei" }
> dictionary.length
=> 2
> dictionary.size
=> 2
```

Exercises: Now would be a good time to do some of the [exercises on
Hashes](/exercises/hashes_1.html).

## Hash syntax confusion

You can skip the following and jump right to the chapter [Variables](/variables.html),
or you can keep reading if you're curious.

We've found it's important for us to explain the following somewhere in our
book, because many online resources use another, alternative syntax for
defining Hashes.

The term *syntax*, in programming, refers to ways to use punctuation in order
to (amongst other things) create objects.

E.g. the fact that we can use square brackets `[]` and commas `,` in order to
define Arrays, and curly braces `{}` and hash rockets `=>` in order to define
Hashes, is part of Ruby's *syntax*.

Today, there are two different syntaxes for defining Hashes with curly braces,
and they have the potential to confuse newcomers a lot.

There's an old-style one, and a new, modern one.

<p class="hint">
We use the old syntax, and ignore the new one, for now.
</p>

Here's why:

Up to a certain version of Ruby the syntax that uses hash rockets was the only
syntax to create Hashes, and it works the same for all Hashes no matter what
kinds of objects you use as keys.

Then, a few years back, a new syntax was introduced. Many Ruby programmers love
to use it, because it takes a little less space, and it also looks a lot like
JSON, which is a data format that is widely used in web applications.

The new Hash syntax looks like this:

```ruby
{ one: "eins", two: "zwei", three: "drei" }
```

Using this syntax we tell Ruby that we want the keys to be symbols.

Hmmmm? We just learned that Symbols are defined by prepending a word with a
colon like `:one`, right?

Well, yes, correct, but that's just how it works: If you define a Hash using
this syntax, then you'll get *a Hash that has Symbols as keys*.

We found the new syntax pretty confusing for beginners: It is slightly less
explicit and obvious, and you have to learn another piece of information.
That's why we simply ignore it in our study groups while we learn what Hashes
are and how you can use them.

Once you feel comfortable using Hashes, you can make your own decision, and
start using the modern syntax if you like it better.

In the meanwhile, whenever you see a Hash using the new syntax somewhere else,
you now know what it means, and where to look it up. Simply remember that these
two Hashes are exactly the same:

```ruby
{ :one => "eins", :two => "zwei", :three => "drei" }
{ one: "eins", two: "zwei", three: "drei" }
```
