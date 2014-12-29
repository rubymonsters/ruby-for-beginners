# Built-in classes

Ruby comes with lots of things already baked in, and provides you with tons
of tools to use, and hit the road running.

We will only look at some of the most widely used types of "things", that is,
classes, and look at some of the ways they can be used. These are:

* Numbers
* Strings
* Symbols
* Arrays
* Hashes

A little later we will then also talk about 3 more types, which are: true,
false, and nil (nothing).


#### Numbers

Numbers simply are numbers. You create one by writing it: `12.34` is Ruby code
and it represents the number twelve-point-three-four.

Under the hood, for reasons that are mostly technical, there are actually
different kinds of numbers. For example there are integer numbers (those
without a comma and decimal places), and depending on their size there are two
kinds of them. For floating point numbers there are even more. Unless you are
super curious, you can perfectly ignore all of that for now, and just think of
numbers as numbers.


#### Strings

A string, in programming languages, is text. E.g. your name, represented in
Ruby, is a string. The title of this text is a string, and so is this paragraph,
and the full text in its entirety.

In Ruby there are a couple, flexible ways to create strings, but the most simple,
and most used way is to simply enclose some characters in quotes:

```ruby
"This is one string!"
'And this is another one.'
```

Both of these are good to use. Technically they are almost the same, except for
one important feature called "string interpolation", which we'll explain later.

(The reason why text, in the context of programming languages, is not referred
to as "text", but instead with the slightly odd term "string" is a historical,
and technical one: In early programming languages strings were implemented as
lists of characters, and programmers had to deal with them as such. One had
to take care of nasty things such as manually managing the length of the
character list. Once languages started to make things easier for developers,
and add built-in abstractions for this concept, these were named "string",
resembling the way programmers had thought about text before: as characters
lined up on strings. Nowadays, in Ruby, you can just think about strings as
text.)

#### Symbols

*Symbols are like strings, except they are code.*

Symbols are a rather strange concept, to be honest, and we only introduce them
this early because symbols are used so often and widely that you'll very likely
find them used in code elsewhere. For your first steps in learning programming
we wouldn't necessarily need them.

Symbols are written like this: `:something`. I.e. there is a word that is
preceeded by a colon. This means that normally symbols do not contain spaces.
Instead, if we have symbols that consist of multiple words we would concatenate
them with underscores, like so: `:another_funny_symbol`.

So when to use strings, and when to use symbols? There's actually no perfectly
clear line or definition. One rule of thumb is that if the text at hand is
"data", then use a string. If it's code, then use a symbol, especially when
used as keys in hashes (see below).

Another way of looking at symbols is that they aren't really text, even though
they read well. Instead they are unique identifiers, like numbers, or bar
codes. While strings represent data that can change, symbols represent unique
values, which are static.

And more technically, if you use strings that contain the same text in your
code multiple times, then a new string object will be created every time. E.g.
if you do `puts "Hello!"` 10 times then 10 actual string objects will be
created (and then discarded, because they're not being used any longer). On the
other hand, if you'd use symbols for this and do `puts :hello` 10 times, then
only one single symbol will be created, and re-used.

If you find this confusing, don't worry. You'll understand symbols better once
you get to use some of them in your code.


#### Arrays

While numbers, strings, and symbols all represent simple, primitive things,
arrays are more interesting, and very useful. They are things that store (or
"hold") other things.

You can think of an array as a collection or list of things, or better yet, as
a bag that you can throw things in: The bag itself is a thing (an object), too.
An array is created by separating values by commas, and enclosing this list
with square brackets, like so:

```ruby
[1, 2, 3]
```

Or:

```ruby
["A string", 1, :some_symbol, 2]
```

This creates an array with 4 elements, i.e. a list that contains 5 things: a
string, a number, a symbol, and another number.

Note that in Ruby you can store any kind of object in an array, and that arrays
always keep their order (unless do something to change it).

Note that in Ruby arrays always keep their order (unless you do something to
change the order), and you can store any kind of objects in arrays. For
example, you can also store arrays in an array: that's a 2-dimensional array,
like a table that has many rows, and each row has many cells ("things").

Arrays can be used in a lot of different, and useful ways, but the most basic
one is to retrieve a certain element by the way of referring to it by position:
"Please get me the element at position 1!"

In Ruby, you can do this with square brackets like so:

```ruby
words = ["one", "two", "three"]
puts words[1]
```

The bit `words[1]` means: from the array `words` get the element at position
`1`. `puts` will then print this value out to the screen.

Funnily, this will print out `two`, and not `one`. Hu? The reason for that is:
The first position in an array is 0, not 1. So the position 1 refers to the
second element, not the first one.

In programming books and the Ruby documentation you'll find the word "index"
being used instead of "position" in this context.

In order to add an element to an existing array you can use the operator `<<`,
called "shovel" operator, like so:

```ruby
words = ["one", "two", "three"]
words << "four"
puts words[3]
```

This prints out `four`.

You can also set an element to a specific index, like so:

```ruby
words = ["one", "two", "three"]
words[3] = "four"
puts words[3]
```

This also prints out `four`.

On formatting: Note that there are no spaces inside the square brackets,
and there's one space after each comma.


#### Hashes

Hashes are another very useful thing that can be used to store objects.

Unlike arrays which are mere lists, so we need to obtain elements by their
position, hashes are like dictionaries: You can use them to look up one
thing by another thing. We say: we look up a value from a hash using a key.
Or one could say: "Please get me the value that is associated with this key."

Imagine a real dictionary that translates from English to German. When you
look up the English word "hello" then you'll find the German "Hallo". When
you look up "one" then you'll find "eins", and so on.

Hashes work pretty much like this. You can create a hash by pointing a key
to a value with `=>`, separate these key/value pairs with commas, and enclose
the whole thing with curly braces. This is how it looks:

```ruby
{ "one" => "eins", "two" => "zwei", "three" => "drei" }
```

This defines a hash that contains 3 key/value pairs, meaning that we can look
up three values (the strings `"eins"`, `"zwei"`, and `"drei"`) using three
different keys (the strings `"one"`, `"two"`, and `"three"`).

Now, how to actually look up the value that is associated with the key `"one"`?
Just like with arrays you use sqare brackets, but instead of passing a number
indicating the position you now pass the key. Like so:

```ruby
dictionary = { "one" => "eins", "two" => "zwei", "three" => "drei" }
puts dictionary["one"]
```

In this example `dictionary` is a hash defined on the first line. `["one"]`
looks up the value associated to the key `"one"` (which is `"eins"`) and
returns it. This value will be passed to `puts` which outputs it to the screen.

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
and many programmers love to use it, because it takes a little less space.

It looks like this:

```ruby
{ one: "eins", two: "zwei", three: "drei" }
```

Using this syntax we tell Ruby that we want the keys to be symbols.

Hmmmm? We just learned that symbols are defined by prepending a word with a
colon like `:one`, right? Well, yes, that's just how it works: If you define
a hash using this syntax, then you'll get a hash that has symbols as keys.

We found the new syntax pretty confusing for beginners: It is slightly less
explicite and obvious, and you have to learn another piece of information.
That's why we simply ignore it in our study groups while we learn what hashes
are and how you can use them.

For now you can simply remember that these two hashes are exactly the same:

```ruby
{ :one => "eins", :two => "zwei", :three => "drei" }
{ one: "eins", two: "zwei", three: "drei" }
```
