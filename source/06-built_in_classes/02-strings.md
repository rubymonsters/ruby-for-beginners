# Strings

A string, in programming languages, is text.

E.g. your name, represented in Ruby, is a string. The title of this text is a
string, and so is this paragraph, and the full text in its entirety.

In Ruby there are a couple, flexible ways to create strings, but the most simple,
and most common way is to simply enclose some characters in quotes:

```ruby
"This is one string!"
'And this is another one.'
```

Both of these are good to use. Technically they are almost the same, except for
one important feature called "string interpolation", which we'll explain later.

The reason why text, in the context of programming languages, is not referred
to as "text", but instead with the slightly odd term "string" is a historical,
and technical one:

In early programming languages strings were implemented as lists of characters,
and programmers had to deal with them as such. One had to take care of nasty
things such as manually managing the length of the character list. Once
languages started to make things easier for developers, and added built-in
abstractions for this concept, these were named "strings", resembling the way
programmers had thought about text before: as characters lined up on strings.

Luckily, nowadays, in Ruby and any other modern language, you can just think
about strings as text.

### Things you can do with strings

Here are a few things you can do with strings.

For example, you can glue them together by using `+`. We also call this
[concatenation](http://www.wikiwand.com/en/Concatenation).

```ruby
$ irb
> "snow" + "ball"
=> "snowball"

> "hi " + "hi " + "hi"
=> "hihihi"
```

The last operation can also be done by using `*`, like so:

```ruby
$ irb
> "hi" * 3
=> "hihihi"
```

I.e. multiplying a string by a number in Ruby means repeating the string as
many times.

The following examples are worth noting, too:


```ruby
$ irb
> "1" + "1" + "1"
=> "111"

> "1" * 3
=> "111"
```

This demonstrates that Ruby behaves the same for strings that contain nothing
but numbers.

Some other things that you can do with strings that you can try yourself in
`irb`:

```ruby
> "hello".upcase
=> "HELLO"

> "hello".capitalize
=> "Hello"

> "hello".length
=> 5

> "hello".reverse
=> "olleh"
```

Exercises: How about doing some of the [exercises on numbers](/16-exercises/02-strings.html)
next?
